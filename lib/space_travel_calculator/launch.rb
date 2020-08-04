# frozen_string_literal: false

module SpaceTravelCalculator
  class Launch
    def self.calculate(weight, gravity)
      fuel_weight = (weight * gravity * 0.042 - 33).to_i
      return 0 if fuel_weight <= 0

      fuel_weight + calculate(fuel_weight, gravity)
    end
  end
end
