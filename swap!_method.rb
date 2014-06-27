def swap!
  length = self.length
  add_at_end = self.pop if length.odd?            # if odd length, pop the last element and save it for later

  even = self.select {|x| self.index(x).even? }   # select the even elements 
  odd = self.select {|x| self.index(x).odd? }     # select the odd elements
  temp = Array.new(length/2, nil).zip(odd, even)  # create temp array to zip
  temp.map {|x| x.delete_at(0) }                  # get rid of leading nils
  temp << add_at_end if length.odd?               # add the popped element if it was odd
  
  self.clear
  self << temp
  return self.flatten!
end