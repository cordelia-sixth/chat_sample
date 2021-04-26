class FileuploadsController < ApplicationController

  def index
    # 画像のパス
    @img_paths = []

    # public/ 以下のjpgファイルの一覧を取得
    jpgs = Dir.glob(Rails.root.join('public', '*.jpeg'))

    # 画像ファイルまでのパスを取得
    jpgs.each do |png|
      # ファイル名の先頭にスラッシュを挿入
      @img_paths.push('/' + File.basename(png))
    end
  end

  def create
    # アップロードされたファイル
    upload_file = fileupload_params[:file]
    puts upload_file

    # ファイルの保存先path
    output_path = Rails.root.join('public', upload_file.original_filename)

    # ファイルを保存
    File.open(output_path, 'w+b') do |fp|
      fp.write upload_file.read
    end

    redirect_to root_path

    # インデックスページへリダイレクト
    # redirect_to action: 'index'
  end

  def new
  end

  private
    def fileupload_params
      params.require(:fileupload).permit(:file)
    end
end
