def name_of(route)
  route.sort.join('_')
end

cities, routes = [ ], { }
File.readlines('input').each do |line|
  route = line.scan(/(\w+) to (\w+)/).flatten
  cities += route
  routes[name_of(route)] = line[/\d+/].to_i
end

cities.uniq!
cities.permutation(cities.length).each do |route|
  routes[route] = route.each_cons(2).map { |x| routes[name_of(x)] }.inject(:+)
end

routes.reject! { |x,_| x.length != cities.length }

# PART ONE
puts "Shortest distance for Santa to travel: #{routes.values.min}"

# PART TWO
puts "Longest distance for Santa to travel: #{routes.values.max}"
