defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    # test "when all params are valid, returns an user" do
    #   params = %{
    #     name: "Name one",
    #     password: "123456",
    #     nickname: "nameOne",
    #     email: "test@banana.com",
    #     age: 27
    #   }

    #   {:ok, %User{id: user_id}} = Create.call(params)
    #   user = Repo.get(User, user_id)

    #   assert %User{name: "Name one", age: 27, id: ˆuser_id} = user
    # end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Name",
        # password: "123456",
        nickname: "nameOne",
        email: "test@banana.com",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
