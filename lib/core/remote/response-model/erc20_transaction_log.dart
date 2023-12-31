// To parse this JSON data, do
//
//     final erc20TransferLog = erc20TransferLogFromJson(jsonString);

// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

Erc20TransferLog erc20TransferLogFromJson(String str) => Erc20TransferLog.fromJson(json.decode(str));

String erc20TransferLogToJson(Erc20TransferLog data) => json.encode(data.toJson());

class Erc20TransferLog {
    Erc20TransferLog({
        required this.status,
        required this.message,
        required this.result,
    });

    String status;
    String message;
    List<ERC20Transfer> result;

    factory Erc20TransferLog.fromJson(Map<String, dynamic> json) => Erc20TransferLog(
        status: json["status"],
        message: json["message"],
        result: List<ERC20Transfer>.from(json["result"].map((x) => ERC20Transfer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class ERC20Transfer {
    ERC20Transfer({
        required this.blockNumber,
        required this.timeStamp,
        required this.hash,
        required this.nonce,
        required this.blockHash,
        required this.from,
        required this.contractAddress,
        required this.to,
        this.value,
        required this.tokenName,
        required this.tokenSymbol,
        required this.tokenDecimal,
        required this.transactionIndex,
        required this.gas,
        required this.gasPrice,
        required this.gasUsed,
        required this.cumulativeGasUsed,
        required this.input,
        required this.confirmations,
    });

    String blockNumber;
    String timeStamp;
    String hash;
    String nonce;
    String blockHash;
    String from;
    String contractAddress;
    String to;
    String? value;
    String tokenName;
    String tokenSymbol;
    String tokenDecimal;
    String transactionIndex;
    String gas;
    String gasPrice;
    String gasUsed;
    String cumulativeGasUsed;
    String input;
    String confirmations;

    factory ERC20Transfer.fromJson(Map<String, dynamic> json) => ERC20Transfer(
        blockNumber: json["blockNumber"],
        timeStamp: json["timeStamp"],
        hash: json["hash"],
        nonce: json["nonce"],
        blockHash: json["blockHash"],
        from: json["from"],
        contractAddress: json["contractAddress"],
        to: json["to"],
        value: json["value"],
        tokenName: json["tokenName"],
        tokenSymbol: json["tokenSymbol"],
        tokenDecimal: json["tokenDecimal"],
        transactionIndex: json["transactionIndex"],
        gas: json["gas"],
        gasPrice: json["gasPrice"],
        gasUsed: json["gasUsed"],
        cumulativeGasUsed: json["cumulativeGasUsed"],
        input: json["input"],
        confirmations: json["confirmations"],
    );

    Map<String, dynamic> toJson() => {
        "blockNumber": blockNumber,
        "timeStamp": timeStamp,
        "hash": hash,
        "nonce": nonce,
        "blockHash": blockHash,
        "from": from,
        "contractAddress": contractAddress,
        "to": to,
        "value": value,
        "tokenName": tokenName,
        "tokenSymbol": tokenSymbol,
        "tokenDecimal": tokenDecimal,
        "transactionIndex": transactionIndex,
        "gas": gas,
        "gasPrice": gasPrice,
        "gasUsed": gasUsed,
        "cumulativeGasUsed": cumulativeGasUsed,
        "input": input,
        "confirmations": confirmations,
    };
}
