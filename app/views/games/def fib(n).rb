def fib(n)
	index = 1
	sequence = [1,1]

	return sequence[0] if n==0

	until index == n
		sequence.push(sequence[index] + sequence[index+1])
		index += 1
	end

	return sequence[n-1]
end