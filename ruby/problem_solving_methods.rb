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


def fib(integer)
	count = 2
	if integer == 0
		return nil
	elsif integer == 1
		return [0]
	elsif integer == 2
		return [0,1]
	else
		array = [0,1]
		while count <= integer
		array[count] = array[count-1] + array[count-2]
		count +=1
		end	
	return array
	end
end 


def bubble_sort(array)
	swap = false
	count = 0 
	n = array.length
	while count < n -1
		if  array[count] > array[count+1]
			array[count], array[count+1] = array[count+1], array[count]
		swap = true 
		end
	count+=1
	end
	if swap == true 
	  bubble_sort(array)
	else  
	return array
	end 
end