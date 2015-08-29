describe User do

  before(:each) { @user = User.new(email: 'user@example.com', name: 'Test User') }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  it "#email retusn a name" do
    expect(@user.name).to eq "Test User"
  end

end
