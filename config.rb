# Blog settings
###

# Time.zone = "UTC"

activate :blog do |blog|

  blog.custom_collections = {
    category: {
      link: '/{category}.html',
      template: '/category.html'
      }
    }


  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
    
  #blog.permalink = "{title}.html"
  blog.permalink = "episodes/{episode_number}.html"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
	#blog.sources = "posts/:year-:title.html"
	blog.sources = "posts/:title.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "layouts/blog-layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".markdown"
  blog.default_extension = ".md"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  #blog.per_page = 4
end

helpers do

end

require "lib/custom_helpers"
helpers CustomHelpers

page "/feed.xml", layout: false

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :relative_links, true

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'


activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.branch = 'gh-pages'
  deploy.build_before = true
end

activate :external_pipeline,
  name: :gulp,
  command: build? ? 'npm run production' : 'npm run gulp',
  source: ".tmp",
  latency: 1

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  activate :gzip

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
  
  #Pretty URL
  activate :directory_indexes
end
