class Dictionary < ApplicationRecord
  validates :word, presence: true
  validates :meaning, presence: true
  validates :language, presence: true
  validates :word, uniqueness: { scope: :language }

  def self.import(file)
    require "roo"

    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[ header, spreadsheet.row(i) ].transpose]

      # Tạo bản ghi cho cả tiếng Việt và tiếng Anh
      create!(
        word: row["word"],
        pronunciation: row["pronunciation"],
        meaning: row["meaning"],
        language: "vi"
      )

      create!(
        word: row["word_en"],
        pronunciation: row["pronunciation_en"],
        meaning: row["meaning_en"],
        language: "en"
      )
    end
  end
end
