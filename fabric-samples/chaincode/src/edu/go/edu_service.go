package main

import (
	"bytes"
	"encoding/json"
	"fmt"

	"github.com/hyperledger/fabric/core/chaincode/shim"
	sc "github.com/hyperledger/fabric/protos/peer"
)

func (s *SmartContract) insertMember(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {

	if len(args) != 4 {
		return shim.Error("Incorrect number of arguments. Expecting 5")
	}

	var member = MemberInfo{EmployeeNo: args[0], Name: args[1], Team: args[2], Position: args[3]}

	memberAsBytes, _ := json.Marshal(member)
	APIstub.PutState(args[0], memberAsBytes)

	return shim.Success(nil)
}

func (s *SmartContract) updateMember(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {

	if len(args) != 3 {
		return shim.Error("Incorrect number of arguments. Expecting 3")
	}

	memberAsBytes, _ := APIstub.GetState(args[0])
	member := MemberInfo{}

	json.Unmarshal(memberAsBytes, &member)
	member.Team 	= args[1]
	member.Position = args[2]

	memberAsBytes, _ = json.Marshal(member)
	APIstub.PutState(args[0], memberAsBytes)

	return shim.Success(nil)
}

func (s *SmartContract) deleteMember(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {

	if len(args) != 1 {
		return shim.Error("Incorrect number of arguments. Expecting 1")
	}

	APIstub.DelState(args[0])

	return shim.Success(nil)
}

func (s *SmartContract) queryMember(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {

	if len(args) != 1 {
		return shim.Error("Incorrect number of arguments. Expecting 1")
	}

	memberAsBytes, _ := APIstub.GetState(args[0])

	return shim.Success(memberAsBytes)
}

func (s *SmartContract) queryMemberByRange(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {

	if len(args) != 2 {
		return shim.Error("Incorrect number of arguments. Expecting 2")
	}

	startKey 	:= args[0]
	endKey 		:= args[1]

	resultsIterator, err := APIstub.GetStateByRange(startKey, endKey)
	if err != nil {
		return shim.Error(err.Error())
	}
	defer resultsIterator.Close()

	var buffer bytes.Buffer
	buffer.WriteString("[")

	bArrayMemberAlreadyWritten := false
	for resultsIterator.HasNext() {
		queryResponse, err := resultsIterator.Next()
		if err != nil {
			return shim.Error(err.Error())
		}

		if bArrayMemberAlreadyWritten == true {
			buffer.WriteString(",")
		}
		buffer.WriteString("{\"Key\":")
		buffer.WriteString("\"")
		buffer.WriteString(queryResponse.Key)
		buffer.WriteString("\"")

		buffer.WriteString(", \"Record\":")
		buffer.WriteString(string(queryResponse.Value))
		buffer.WriteString("}")
		bArrayMemberAlreadyWritten = true
	}
	buffer.WriteString("]")

	fmt.Printf("- queryMembers:\n%s\n", buffer.String())

	return shim.Success(buffer.Bytes())
}