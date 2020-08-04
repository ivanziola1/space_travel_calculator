# frozen_string_literal: false

module SpaceTravelCalculator
  class Landing
    def self.calculate(weight, gravity)
      fuel_weight = (weight * gravity * 0.033 - 42).to_i
      return 0 if fuel_weight <= 0

      fuel_weight + calculate(fuel_weight, gravity)
    end
  end
end
