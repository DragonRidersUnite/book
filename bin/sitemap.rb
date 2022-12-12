#!/usr/bin/env ruby
require 'rubygems'
require 'sitemap_generator'

puts `mdbook build`

SitemapGenerator::Sitemap.default_host = 'https://book.dragonriders.community'
SitemapGenerator::Sitemap.public_path = 'book'
SitemapGenerator::Sitemap.compress = false
SitemapGenerator::Sitemap.create do
  # assumes no nested URLs
  Dir.glob('book/*.html').each do |file|
    file = file.split('/').last
    next if file == "index.html" || file == "introduction.html"
    add "/#{file}", changefreq: 'weekly'
  end
end
SitemapGenerator::Sitemap.ping_search_engines
