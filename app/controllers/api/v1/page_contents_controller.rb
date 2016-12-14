class Api::V1::PageContentsController < ApiController
  def index
    page_contents = PageContent.all
    respond_to do |format|
      format.json { render json: page_contents, status: :success }
      format.xml { render xml: page_contents, status: :success }
    end
  end
  
  def parse_page
    doc = Nokogiri::HTML(open(params[:url]))
    content = ''
    doc.css("h1").each do |h|
      puts h.text
      content << h.text
    end
    doc.css("h2").each do |h|
      puts h.text
      content << h.text
    end
    doc.css("h3").each do |h|
      puts h.text
      content << h.text
    end
    page_content = PageContent.new(url: params[:url],content: content)
    respond_to do |format|
      if page_content.save
        format.json { render json: page_content, status: :created }
        format.xml { render xml: page_content, status: :created }
      else
        format.json { render json: page_content.errors, status: :unprocessable_entity }
        format.xml { render xml: page_content.errors, status: :unprocessable_entity }
      end
    end
  end
end