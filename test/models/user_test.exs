defmodule ProjectElixir.UserTest do
  use ProjectElixir.ModelCase

  alias ProjectElixir.User

  @valid_attrs %{city: "some content", country: "some content", direction: "some content", email: "some content", name: "some content", password: "some content", telephone: 42, verify: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
