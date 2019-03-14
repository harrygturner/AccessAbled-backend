require 'csv'

class SeedAttractions

   def self.read_csv
      array = []

      CSV.foreach('db/seed_data/seedData.csv', headers: true, encoding: 'iso-8859-1:utf-8') do |row|
         array << row
      end 
      array
   end 

   def self.make_hash_boilerplate
      nhash = {}
      array = self.read_csv
      array.each do |row|
         if row[0] == array[0][0]
            row.each do |col_name|
               nhash[col_name[0].to_sym] = nil
            end 
         end 
      end
      nhash
   end 

   def self.parse_attractions
      final_hash = []
      toadd = {}
      array = self.read_csv
      keys = self.make_hash_boilerplate.keys
      array.each do |row|
         i = 0
         while i < row.length
            toadd[keys[i]] = row[i]
            i = i + 1
         end 
         final_hash << toadd
      end
      final_hash
   end 

end 