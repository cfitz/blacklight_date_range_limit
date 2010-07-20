# Include hook code here

config.to_prepare do
  CatalogController.helper(BlacklightRangeLimit::ViewHelperOverride)
  SearchHistoryController.helper(BlacklightRangeLimit::ViewHelperOverride)
  CatalogController.helper(RangeLimitHelper)
  SearchHistoryController.helper(RangeLimitHelper)

  CatalogController.send(:include, BlacklightRangeLimit::SolrHelperOverride)

  CatalogController.before_filter do |controller| 
    controller.stylesheet_links << ["blacklight_range_limit", {:plugin => "blacklight_range_limit"}]

    controller.javascript_includes << ["range_limit_slider", {:plugin => "blacklight_range_limit"}]

    # Replace with local version. 
    controller.javascript_includes << "http://flot.googlecode.com/svn/trunk/jquery.flot.js"
  end

  
end
