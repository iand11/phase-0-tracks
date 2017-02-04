def array_search (array, number)
	count = 0
	array.each do |item|
		if item == number 
			return count
			  break
		end 
			count += 1
	   end
	   if number != array.last
	    return nil
	end

end 

array = [1, 3, 5, 66, 7]
array_search(array, 66)