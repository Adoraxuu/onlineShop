module ProductsHelper
  def product_cover(product, variant = :cover_sm)
    if product.cover.attached?
      image_tag product.cover.variant(variant)
    else
      image_tag "/images/products/default.jpg"
    end
  end
end
