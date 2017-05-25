###
# Page options, layouts, aliases and proxies
###

activate :external_pipeline,
         name: :webpack,
         command: build? ?
           "./node_modules/webpack/bin/webpack.js --bail -p" :
           "./node_modules/webpack/bin/webpack.js --watch -d --progress --color",
         source: ".tmp/dist",
         latency: 1

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

page '/', layout: :blog
page '/misc/*.html', layout: :misc

set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true


# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

activate :blog do |blog|
  blog.permalink = "{title}.html"
  blog.sources = "posts/{title}.html"
  blog.layout = "article"
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"


  # Matcher for blog source files
  # blog.sources = "posts/{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"

  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
