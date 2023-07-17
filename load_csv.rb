require 'csv'
require_relative 'patient'

csv_file = 'patients.csv'

patients = []

CSV.foreach(csv_file, headers: :first_row, header_converters: :symbol) do |row|
  row[:id] = row[:id].to_i
  row[:cured] = row[:cured] == "true"
  patient = Patient.new(row)
  patients << patient
end

p patients
