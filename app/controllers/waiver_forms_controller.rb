class WaiverFormsController < ApplicationController


  # GET /waiver_forms/new
  def new
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true)
    nda = File.read(Rails.root.join('lib/docs/ptdr-0815.md'))

    @nda = markdown.render(nda)
    @waiver_form = WaiverForm.new
  end


  # POST /waiver_forms
  # POST /waiver_forms.json
  def create
    @waiver_form = WaiverForm.new(waiver_form_params)

      if @waiver_form.save
        redirect_to new_waiver_form_path
      else
        format.html { render :new }
      end
  end

  def thank_you
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waiver_form
      @waiver_form = WaiverForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waiver_form_params
      params.require(:waiver_form).permit(:name, :email, :signature)
    end
end
