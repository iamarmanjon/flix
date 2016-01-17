describe "Deleting a user" do
  it "destroys the user and shows the user listing without the deleted user" do
    user = User.create!(user_attributes)

    visit user_path(user)

    click_link 'Delete Account'

    expect(current_path).to eq(users_path)
    expect(page).to have_text('Account successfully deleted!')

    visit users_path

    expect(page).not_to have_text(user.name)
  end

  it "automatically signs out the user" do
    user = User.create!(user_attributes)

    sign_in(user)
    visit user_path(user)

    click_link 'Delete Account'

    expect(page).not_to have_link 'Sign Out'
    expect(page).to have_link 'Sign In'
  end
end
