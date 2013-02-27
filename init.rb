Redmine::Plugin.register :dpi_cmi do
  name 'Dpi Cmi plugin'
  author 'Pablo Moreira Mora'
  description 'DPI CMI is a Redmine plugin to have a summary of projects management metrics'
  version '0.0.1'
  author_url 'http://www.linkedin.com/in/pablomoreiramora'

  permission :goals, { :goals => [:index] }, :public => true
  menu :project_menu, :goals, { :controller => 'goals', :action => 'index' },
    :caption => :'cmi.label_tab',
    :after => :activity,
    :params => :project_id
end
