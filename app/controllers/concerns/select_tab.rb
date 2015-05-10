module SelectTab
	def self.included(controller)
		controller.before_filter :set_selected_tab
		controller.helper_method :selected_tab?
	end

  def select_tab(tab, subtab=nil)
    @selected_tab = tab
		@selected_subtab = subtab
  end

  def selected_tab
    @selected_tab
  end

  def selected_subtab
    @selected_subtab
  end

	def selected_tab?(tab, options={})
		return current_page?(options) unless @selected_tab

		[@selected_tab, @selected_subtab].include?(tab)
	end

	def set_selected_tab
    select_tab(controller_name.to_sym)
	end
end
