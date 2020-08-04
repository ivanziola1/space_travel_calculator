# frozen_string_literal: true

require 'space_travel_calculator/landing'
require 'space_travel_calculator/launch'
require 'space_travel_calculator/version'

# user will be working with the gem trough this module
module SpaceTravelCalculator
  class InvalidInputError < StandardError; end
  class UnpermittedOperationError < StandardError; end
  class UnpermittedGravityError < StandardError; end

  OPERATION_MAPPINGS = {
    launch: 'Launch',
    land: 'Landing'
  }.freeze
  PERMITTED_GRAVITIES = [9.807, 1.62, 3.711].freeze

  class << self
    def fuel(weight, travels)
      current_travel = travels.pop
      validate_input_data!(weight, current_travel)

      operation, gravity = current_travel
      fuel_weight = calculate_fuel_weight(operation, weight, gravity)
      return fuel_weight if travels.empty?

      fuel_weight + fuel(weight + fuel_weight, travels)
    end

    private

    def validate_input_data!(weight, current_travel)
      raise InvalidInputError, 'Equipment weight is invalid' unless weight.positive?

      raise InvalidInputError, 'Second argument is not an array' unless current_travel.is_a?(Array)

      raise InvalidInputError, 'Second argument\'s length is invalid' unless current_travel.length == 2

      raise UnpermittedOperationError, 'Unpermitted operation' unless OPERATION_MAPPINGS.key?(current_travel.first)

      raise UnpermittedGravityError, 'Unpermitted gravity' unless PERMITTED_GRAVITIES.include?(current_travel.last)
    end

    def calculate_fuel_weight(operation, mass, gravity)
      calculation_klass = SpaceTravelCalculator.const_get(OPERATION_MAPPINGS[operation])
      calculation_klass.calculate(mass, gravity)
    end
  end
end
