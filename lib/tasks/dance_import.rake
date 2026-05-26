namespace :dance do
  desc "Import one or many dance figures from a YAML file"
  task import_yaml: :environment do
    require "yaml"

    print "Path to YAML file: "
    path = STDIN.gets.chomp

    unless File.exist?(path)
      puts "File not found: #{path}"
      exit
    end

    data = YAML.load_file(path)

    # Support both single-figure and multi-figure YAML formats
    figures = if data["figures"]
                data["figures"]
              else
                [data] # wrap single figure format
              end

    puts "Importing #{figures.size} figure(s)..."
    puts "----------------------------------------"

    figures.each_with_index do |entry, index|
      puts "\nFigure #{index + 1} of #{figures.size}"

      figure_data   = entry["figure"]
      elements_data = entry["elements"] || []
      steps_data    = entry["steps"]    || []

      # Create the Figure
      figure = Figure.create!(
        name:  figure_data["name"],
        role:  figure_data["role"],
        notes: figure_data["notes"]
      )

      puts "Created Figure ##{figure.id}: #{figure.name} (#{figure.role})"

      # Create Elements
      element_lookup = {}

      elements_data.each do |el|
        element = figure.elements.create!(name: el["name"])
        element_lookup[el["name"]] = element
        puts "  Added Element: #{element.name}"
      end

      # Create Steps
      steps_data.each do |step|
        element_name = step["element"]
        element = element_lookup[element_name]

        unless element
          puts "  ERROR: Step references unknown element '#{element_name}'"
          exit
        end

        figure.steps.create!(
          step_number:   step["step_number"],
          element:       element,
          foot_position: step["foot_position"],
          details:       step["details"],
          count:         step["count"]
        )

        puts "  Added Step #{step["step_number"]} (#{element_name})"
      end
    end

    puts "\nAll figures imported successfully!"
  end
end
