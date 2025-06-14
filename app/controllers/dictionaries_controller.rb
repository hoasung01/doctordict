class DictionariesController < ApplicationController
  def index
    @dictionaries = Dictionary.all.order(:word)
  end

  def show
    @dictionary = Dictionary.find(params[:id])
  end

  def search
    @query = params[:q]
    @language = params[:language]

    if @query.present?
      @dictionaries = Dictionary.where("word ILIKE ?", "%#{@query}%")
      @dictionaries = @dictionaries.where(language: @language) if @language.present?
    else
      @dictionaries = Dictionary.none
    end
  end

  def import
    if request.post?
      if params[:file].present?
        begin
          Dictionary.import(params[:file])
          redirect_to dictionaries_path, notice: "Import thành công!"
        rescue => e
          redirect_to import_dictionaries_path, alert: "Lỗi khi import: #{e.message}"
        end
      else
        redirect_to import_dictionaries_path, alert: "Vui lòng chọn file để import"
      end
    end
  end
end
