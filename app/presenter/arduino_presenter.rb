class ArduinoPresenter
	delegate :user, :created_at, :name, :mac, :to => :@arduino
	
	def initialize(arduino, context, show_form=true)
		@context = context
		@arduino = arduino
		@show_form = show_form
	end
	
	def show_form?
		@show_form
	end
	
	def route
		@arduino
	end
	
	def to_partial_path
		'arduino'
	end
end