def find_item_by_name_in_collection(name, collection)
 collection_index = 0

  while collection_index < collection.size do
    current_item = collection[collection_index]
    if ( current_item[:item] == name )
      return current_item
    end
    collection_index += 1
  end
  nil
  
  # Implement me first!
  #
  # Consult README for inputs and outputs
end

def consolidate_cart(cart)
  
  updated_cart = Array.new
  cart_index = 0

  while cart_index < cart.size do
    current_item = cart[cart_index]
    if ( find_item_by_name_in_collection( current_item[:item], updated_cart ) == nil)
      current_item[:count] = 1
      updated_cart.push(current_item)
    else
      increment_count_of_item( updated_cart, current_item[:item] )
    end
    cart_index += 1
  end
  updated_cart
  
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
end

def apply_coupons(cart, coupons)
  
  updated_cart = Array.new
  cart_index = 0

  while cart_index < cart.size do
    current_item = cart[cart_index]
    if ( find_item_by_name_in_collection( current_item[:item], updated_cart ) == nil)
      current_item[:count] = 1
      updated_cart.push(current_item)
    else
      increment_count_of_item( updated_cart, current_item[:item] )
    end
    cart_index += 1
  end
  updated_cart
  
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  
  cart_index = 0
  ready_for_checkout = Array.new

  while cart_index < cart.size do
    current_item = cart[cart_index]
    if ( current_item[:clearance] )
      current_item[:price] = current_item[:price] - ( current_item[:price] * 0.20 )
    end
    ready_for_checkout.push( current_item )
    cart_index += 1 
  end
  ready_for_checkout
  
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  
  checkout = consolidate_cart( cart )
  checkout = apply_coupons( checkout, coupons )
  checkout = apply_clearance( checkout )

  index = 0
  grand_total = 0

  while index < checkout.size do
    current_item_total = checkout[index][:price] * checkout[index][:count]
    current_item_total.round(2)
    grand_total += current_item_total
    index += 1
  end
  if ( grand_total > 100 )
    grand_total *= 0.90
  end
  grand_total
  
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
