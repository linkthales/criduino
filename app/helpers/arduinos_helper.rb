module ArduinosHelper
	def belongs_to_user(arduino)
		user_signed_in? && arduino.user == current_user
	end
end