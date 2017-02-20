require 'ostruct'
module ApplicationHelper
  def my_taxons_tree
    cate = []
    Spree::Taxonomy.all.map do |t|
      result = []
      if t.root.children.any?
        t.root.children.each do |c|
          o = OpenStruct.new
          o.name = c.name
          o.url = seo_url(c)
          result << o
        end
        taxon = OpenStruct.new
        taxon.main_name = t.name
        taxon.url = seo_url(t.root)
        taxon.children = result
        cate << taxon
      end
    end
    cate
  end
end
