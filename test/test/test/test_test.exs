defmodule Test.TestTest do
  use Test.DataCase

  alias Test.Test

  describe "contracts" do
    alias Test.Test.Contract

    @valid_attrs %{cost: "some cost", ends_on: "some ends_on"}
    @update_attrs %{cost: "some updated cost", ends_on: "some updated ends_on"}
    @invalid_attrs %{cost: nil, ends_on: nil}

    def contract_fixture(attrs \\ %{}) do
      {:ok, contract} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test.create_contract()

      contract
    end

    test "list_contracts/0 returns all contracts" do
      contract = contract_fixture()
      assert Test.list_contracts() == [contract]
    end

    test "get_contract!/1 returns the contract with given id" do
      contract = contract_fixture()
      assert Test.get_contract!(contract.id) == contract
    end

    test "create_contract/1 with valid data creates a contract" do
      assert {:ok, %Contract{} = contract} = Test.create_contract(@valid_attrs)
      assert contract.cost == "some cost"
      assert contract.ends_on == "some ends_on"
    end

    test "create_contract/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test.create_contract(@invalid_attrs)
    end

    test "update_contract/2 with valid data updates the contract" do
      contract = contract_fixture()
      assert {:ok, contract} = Test.update_contract(contract, @update_attrs)
      assert %Contract{} = contract
      assert contract.cost == "some updated cost"
      assert contract.ends_on == "some updated ends_on"
    end

    test "update_contract/2 with invalid data returns error changeset" do
      contract = contract_fixture()
      assert {:error, %Ecto.Changeset{}} = Test.update_contract(contract, @invalid_attrs)
      assert contract == Test.get_contract!(contract.id)
    end

    test "delete_contract/1 deletes the contract" do
      contract = contract_fixture()
      assert {:ok, %Contract{}} = Test.delete_contract(contract)
      assert_raise Ecto.NoResultsError, fn -> Test.get_contract!(contract.id) end
    end

    test "change_contract/1 returns a contract changeset" do
      contract = contract_fixture()
      assert %Ecto.Changeset{} = Test.change_contract(contract)
    end
  end
end
