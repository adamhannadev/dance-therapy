# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Clear existing data (optional)
Figure.destroy_all
Element.destroy_all
Step.destroy_all

###############################################
# FIGURE: Box Step – Leader
###############################################

leader_figure = Figure.create!(
  name: "Box Step",
  role: "leader",
  notes: "Classic Bronze figure. Emphasize early rotation on 1 and 4. Maintain consistent rise and fall."
)

# Elements
leader_forward = leader_figure.elements.create!(name: "Forward Half of the Box")
leader_back    = leader_figure.elements.create!(name: "Back Half of the Box")

# Steps
leader_figure.steps.create!([
  {
    step_number: 1,
    element: leader_forward,
    foot_position: "Step LF forward",
    details: "Commence to TL",
    count: "1"
  },
  {
    step_number: 2,
    element: leader_forward,
    foot_position: "Step RF side and slightly forward",
    details: "Continue to TL between 1 and 2",
    count: "2"
  },
  {
    step_number: 3,
    element: leader_forward,
    foot_position: "Close LF to RF",
    details: "N/A",
    count: "3"
  },
  {
    step_number: 4,
    element: leader_back,
    foot_position: "RF back",
    details: "Commence to TR",
    count: "1"
  },
  {
    step_number: 5,
    element: leader_back,
    foot_position: "LF side",
    details: "Continue TR over 2 and 3",
    count: "2"
  },
  {
    step_number: 6,
    element: leader_back,
    foot_position: "RF closes to LF",
    details: "N/A",
    count: "3"
  }
])

###############################################
# FIGURE: Box Step – Follower
###############################################

follower_figure = Figure.create!(
  name: "Box Step",
  role: "follower",
  notes: "Mirror of leader’s actions. Maintain connection and shape through rotation."
)

# Elements
follower_forward = follower_figure.elements.create!(name: "Forward Half of the Box")
follower_back    = follower_figure.elements.create!(name: "Back Half of the Box")

# Steps (natural opposites)
follower_figure.steps.create!([
  {
    step_number: 1,
    element: follower_forward,
    foot_position: "Step RF back",
    details: "Commence to TR",
    count: "1"
  },
  {
    step_number: 2,
    element: follower_forward,
    foot_position: "Step LF side and slightly back",
    details: "Continue to TR between 1 and 2",
    count: "2"
  },
  {
    step_number: 3,
    element: follower_forward,
    foot_position: "Close RF to LF",
    details: "N/A",
    count: "3"
  },
  {
    step_number: 4,
    element: follower_back,
    foot_position: "LF forward",
    details: "Commence to TL",
    count: "1"
  },
  {
    step_number: 5,
    element: follower_back,
    foot_position: "RF side",
    details: "Continue TL over 2 and 3",
    count: "2"
  },
  {
    step_number: 6,
    element: follower_back,
    foot_position: "LF closes to RF",
    details: "N/A",
    count: "3"
  }
])
