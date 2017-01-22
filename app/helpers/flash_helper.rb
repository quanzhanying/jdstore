module FlashHelper
	def convert(key)
		case key
		when "alert"
			"danger"
		when "warning"
			"warning"
		when "notice"
			"success"
		end
	end
end