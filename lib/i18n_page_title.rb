# PageTitle
module I18nPageTitleHelper
  # show page title
  def page_title
    return nil if @page_title_off
    title = @page_title
    full_controller_name = controller.class.name.gsub(/Controller$/, '').underscore.gsub("/", ".")
    # NOTE: raise exception when key not found if raise option is true.
    title ||= (I18n.t("page_titles.#{full_controller_name}.#{action_name}", :raise => true) rescue nil)
    title ||= I18n.t("page_titles.#{full_controller_name}_title") + I18n.t("page_titles.defaults.#{action_name}")
    h(title)
  end
end
