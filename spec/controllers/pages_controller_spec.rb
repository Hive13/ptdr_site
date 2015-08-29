# spec/controllers/pages_controller_spec.rb
describe PagesController, '#show' do
  %w(media sponsors winners about contact).each do |page|
    context "on GET to /pages/#{page}" do
      before do
        get :show, id: page
      end

      it { should respond_with(:success) }
      it { should render_template(page) }
    end
  end
end