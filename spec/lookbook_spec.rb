describe Lookbook do

  it "should create the database file" do
    expect(File.exists?(@db_path)).to be_true
  end

end