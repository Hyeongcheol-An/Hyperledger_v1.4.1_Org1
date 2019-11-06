package main

import (
	"encoding/json"
	"fmt"

	"github.com/hyperledger/fabric/core/chaincode/shim"
	sc "github.com/hyperledger/fabric/protos/peer"
)

type SmartContract struct {
}

func (s *SmartContract) Init(APIstub shim.ChaincodeStubInterface) sc.Response {

	members := []MemberInfo{
		MemberInfo{EmployeeNo: "52134", Name: "Hyeongcheol An", Team: "Blockchain Technology Team", Position: "Enterprise Application Development Associate"},
		MemberInfo{EmployeeNo: "12352", Name: "Yonga Oh", Team: "Blockchain Technology Team", Position: "Business Engineering Professional"},
		MemberInfo{EmployeeNo: "31213", Name: "Seongyeol Park", Team: "Blockchain Technology Team", Position: "Enterprise Application Development Professional"},
	}

	i := 0
	for i < len(members) {
		memberAsBytes, _ := json.Marshal(members[i])
		APIstub.PutState(members[i].EmployeeNo, memberAsBytes)
		i = i + 1
	}

	return shim.Success(nil)
}

func (s *SmartContract) Invoke(APIstub shim.ChaincodeStubInterface) sc.Response {

	function, args := APIstub.GetFunctionAndParameters()

	if function == "insertMember" {
		return s.insertMember(APIstub, args)
	} else if function == "updateMember" {
		return s.updateMember(APIstub, args)
	} else if function == "deleteMember" {
		return s.deleteMember(APIstub, args)
	} else if function == "queryMember" {
		return s.queryMember(APIstub, args)
	} else if function == "queryMemberByRange" {
		return s.queryMemberByRange(APIstub, args)
	}

	return shim.Error("Invalid Smart Contract function name.")
}

func main() {

	err := shim.Start(new(SmartContract))
	if err != nil {
		fmt.Printf("Error creating new Smart Contract: %s", err)
	}
}