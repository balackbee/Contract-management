defmodule Test.RegistrationController do
    use Test.Web, :controller
    alias Test.User
    alias Test.Repo
    
  
    def new(conn, _params) do
        changeset = User.changeset(%User{})
    render conn, changeset: changeset
    
    end

    def create(conn, %{"user" => user_params}) do
        # params = { :name=> user_params[:name], :email => user_params[:email], :password => user_params[:password]}
        changeset = User.changeset(%User{}, user_params)
      
        case Test.Registration.create(changeset, Test.Repo) do
            {:ok, changeset} ->
                conn
                |> put_flash(:info, "Your account was created")
                |> redirect(to: "/")
              {:error, changeset} ->
                conn
                |> put_flash(:info, "Unable to create account")
                |> render("new.html", changeset: changeset)
        end
      end
  end
  