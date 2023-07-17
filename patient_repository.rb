require 'csv'
require_relative 'patient'

class PatientRepository
  attr_reader :patients

  def initialize(csv_file, room_repo)
    @csv_file = csv_file
    @room_repo = room_repo
    @patients = []
    @next_id = 1
    load_csv
  end

  def create(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
    save_csv # TODO
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == "true"
      patient = Patient.new(row)
      patient.room = @room_repo.find(row[:room_id])
      @patients << patient
    end
    # @next_id = @patients.empty? ? 1 : @patients.last.id + 1
    @next_id = @patients.last.id + 1 unless @patients.empty?
  end
end

csv_file = 'patients.csv'
repo = PatientRepository.new(csv_file)

nozomu = Patient.new(name: "nozomu")
repo.create(nozomu)

pj = Patient.new(name: "pj")
repo.create(pj)

p repo.patients
