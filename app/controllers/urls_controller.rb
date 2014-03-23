
class UrlsController < ApplicationController
	def new
   @shortened_url = Url.new
  end

 def create
   @shortened_url = Url.new(public_params)
    if !@shortened_url.link.start_with?('http') and !@shortened_url.link.to_s.empty?
      @shortened_url.link = "http://#{@shortened_url.link}"
    end

   if @shortened_url.save
    flash[:masked_id] = @shortened_url.to62.join()
    redirect_to new_url_url
   else
     render :action => "new"
   end
 end

 def show
    @shortened_url = Url.find(Url.toInt(params[:id].to_s.split(//)))
   redirect_to @shortened_url.link
 end

 private

 def public_params
   params.require(:url).permit(:link)
 end

end