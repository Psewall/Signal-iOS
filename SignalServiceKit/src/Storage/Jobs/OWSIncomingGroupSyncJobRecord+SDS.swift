//
//  Copyright (c) 2019 Open Whisper Systems. All rights reserved.
//

import Foundation
import GRDB
import SignalCoreKit

// NOTE: This file is generated by /Scripts/sds_codegen/sds_generate.py.
// Do not manually edit it, instead run `sds_codegen.sh`.

// MARK: - Typed Convenience Methods

@objc
public extension OWSIncomingGroupSyncJobRecord {
    // NOTE: This method will fail if the object has unexpected type.
    class func anyFetchIncomingGroupSyncJobRecord(uniqueId: String,
                                   transaction: SDSAnyReadTransaction) -> OWSIncomingGroupSyncJobRecord? {
        assert(uniqueId.count > 0)

        guard let object = anyFetch(uniqueId: uniqueId,
                                    transaction: transaction) else {
                                        return nil
        }
        guard let instance = object as? OWSIncomingGroupSyncJobRecord else {
            owsFailDebug("Object has unexpected type: \(type(of: object))")
            return nil
        }
        return instance
    }

    // NOTE: This method will fail if the object has unexpected type.
    func anyUpdateIncomingGroupSyncJobRecord(transaction: SDSAnyWriteTransaction, block: (OWSIncomingGroupSyncJobRecord) -> Void) {
        anyUpdate(transaction: transaction) { (object) in
            guard let instance = object as? OWSIncomingGroupSyncJobRecord else {
                owsFailDebug("Object has unexpected type: \(type(of: object))")
                return
            }
            block(instance)
        }
    }
}

// MARK: - SDSSerializer

// The SDSSerializer protocol specifies how to insert and update the
// row that corresponds to this model.
class OWSIncomingGroupSyncJobRecordSerializer: SDSSerializer {

    private let model: OWSIncomingGroupSyncJobRecord
    public required init(model: OWSIncomingGroupSyncJobRecord) {
        self.model = model
    }

    // MARK: - Record

    func asRecord() throws -> SDSRecord {
        let id: Int64? = model.sortId > 0 ? Int64(model.sortId) : model.grdbId?.int64Value

        let recordType: SDSRecordType = .incomingGroupSyncJobRecord
        let uniqueId: String = model.uniqueId

        // Base class properties
        let failureCount: UInt = model.failureCount
        let label: String = model.label
        let status: SSKJobRecordStatus = model.status

        // Subclass properties
        let attachmentId: String? = model.attachmentId
        let attachmentIdMap: Data? = nil
        let contactThreadId: String? = nil
        let envelopeData: Data? = nil
        let invisibleMessage: Data? = nil
        let messageId: String? = nil
        let removeMessageAfterSending: Bool? = nil
        let threadId: String? = nil

        return JobRecordRecord(delegate: model, id: id, recordType: recordType, uniqueId: uniqueId, failureCount: failureCount, label: label, status: status, attachmentIdMap: attachmentIdMap, contactThreadId: contactThreadId, envelopeData: envelopeData, invisibleMessage: invisibleMessage, messageId: messageId, removeMessageAfterSending: removeMessageAfterSending, threadId: threadId, attachmentId: attachmentId)
    }
}