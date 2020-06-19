def pet_shop_name(pet_shop)
    return pet_shop[:name]
end

def total_cash(pet_shop)
    return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
    return pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
    return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
    return pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
    return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
    pets = []
    for pet in pet_shop[:pets]
        if (pet[:breed] == breed)
            pets.push(breed)
        end
    end
    return pets
end

def find_pet_by_name(pet_shop, pet_name)
    for pet in pet_shop[:pets]
        return pet if (pet[:name] == pet_name)
    end
    return nil
end

def remove_pet_by_name(pet_shop, pet_name)
   for pet in pet_shop[:pets]
        if (pet[:name] == pet_name)
            pet_shop[:pets].delete(pet)
        end
    end
end

def add_pet_to_stock(pet_shop, new_pet)
    pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
    return customer[:cash]
end

def remove_customer_cash(customer, amount)
    return customer[:cash] -= amount
end

def customer_pet_count(customer)
    return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
    customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
    if (customer[:cash] >= new_pet[:price])
        return true
    else
        return false
    end
end

def sell_pet_to_customer(pet_shop, pet, customer)
    
    return "Pet not found." if (pet == nil)
    return "insufficient funds." if (customer[:cash] < pet[:price])

    customer[:pets].push(pet)
    customer[:cash] -= pet[:price]
    pet_shop[:pets].delete(pet)
    pet_shop[:admin][:total_cash] += pet[:price]
    pet_shop[:admin][:pets_sold] += 1
    
end