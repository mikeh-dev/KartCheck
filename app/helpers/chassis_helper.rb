module ChassisHelper
  def formatted_stolen_status(chassis)
    chassis.stolen == "stolen" ? "Stolen" : "Not Stolen"
  end
end
