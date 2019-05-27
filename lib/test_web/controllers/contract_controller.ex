defmodule Test.ContractController do
  use Test.Web, :controller

  alias Test.Session
  alias Test.Test.Contract

  def index(conn, _params) do
    contracts = Test.Test.list_contracts()
    render(conn, "index.html", contracts: contracts)
  end

  def new(conn, _params) do
    if Test.Session.current_user(conn) do
      changeset = Test.Test.change_contract(%Contract{})
      render(conn, "new.html", changeset: changeset)
    end
    conn 
    |> put_flash(:info, "Please login to create contract.")
    |> redirect(to: session_path(conn, :new))
  end

  def create(conn, %{"contract" => contract_params}) do
    case Test.Test.create_contract(contract_params) do
      {:ok, contract} ->
        conn
        |> put_flash(:info, "Contract created successfully.")
        |> redirect(to: contract_path(conn, :show, contract))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    contract = Test.Test.get_contract!(id)
    render(conn, "show.html", contract: contract)
  end

  def edit(conn, %{"id" => id}) do
    contract = Test.Test.get_contract!(id)
    changeset = Test.Test.change_contract(contract)
    render(conn, "edit.html", contract: contract, changeset: changeset)
  end

  def update(conn, %{"id" => id, "contract" => contract_params}) do
    contract = Test.Test.get_contract!(id)

    case Test.Test.update_contract(contract, contract_params) do
      {:ok, contract} ->
        conn
        |> put_flash(:info, "Contract updated successfully.")
        |> redirect(to: contract_path(conn, :show, contract))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", contract: contract, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    contract = Test.Test.get_contract(id)
    {:ok, _contract} = Test.Test.delete_contract(contract)

    conn
    |> put_flash(:info, "Contract deleted successfully.")
    |> redirect(to: contract_path(conn, :index))
  end

  #def logout(conn, _) do
    #conn
   # |> Test.Test.Plug.sign_out()
  #  |> redirect(to: session_path(conn, :login))
 # end

end
