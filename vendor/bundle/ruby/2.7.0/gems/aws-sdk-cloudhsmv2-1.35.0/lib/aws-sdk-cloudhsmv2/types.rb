# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws::CloudHSMV2
  module Types

    # Contains information about a backup of an AWS CloudHSM cluster. All
    # backup objects contain the `BackupId`, `BackupState`, `ClusterId`, and
    # `CreateTimestamp` parameters. Backups that were copied into a
    # destination region additionally contain the `CopyTimestamp`,
    # `SourceBackup`, `SourceCluster`, and `SourceRegion` parameters. A
    # backup that is pending deletion will include the `DeleteTimestamp`
    # parameter.
    #
    # @!attribute [rw] backup_id
    #   The identifier (ID) of the backup.
    #   @return [String]
    #
    # @!attribute [rw] backup_state
    #   The state of the backup.
    #   @return [String]
    #
    # @!attribute [rw] cluster_id
    #   The identifier (ID) of the cluster that was backed up.
    #   @return [String]
    #
    # @!attribute [rw] create_timestamp
    #   The date and time when the backup was created.
    #   @return [Time]
    #
    # @!attribute [rw] copy_timestamp
    #   The date and time when the backup was copied from a source backup.
    #   @return [Time]
    #
    # @!attribute [rw] never_expires
    #   Specifies whether the service should exempt a backup from the
    #   retention policy for the cluster. `True` exempts a backup from the
    #   retention policy. `False` means the service applies the backup
    #   retention policy defined at the cluster.
    #   @return [Boolean]
    #
    # @!attribute [rw] source_region
    #   The AWS Region that contains the source backup from which the new
    #   backup was copied.
    #   @return [String]
    #
    # @!attribute [rw] source_backup
    #   The identifier (ID) of the source backup from which the new backup
    #   was copied.
    #   @return [String]
    #
    # @!attribute [rw] source_cluster
    #   The identifier (ID) of the cluster containing the source backup from
    #   which the new backup was copied.
    #   @return [String]
    #
    # @!attribute [rw] delete_timestamp
    #   The date and time when the backup will be permanently deleted.
    #   @return [Time]
    #
    # @!attribute [rw] tag_list
    #   The list of tags for the backup.
    #   @return [Array<Types::Tag>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/Backup AWS API Documentation
    #
    class Backup < Struct.new(
      :backup_id,
      :backup_state,
      :cluster_id,
      :create_timestamp,
      :copy_timestamp,
      :never_expires,
      :source_region,
      :source_backup,
      :source_cluster,
      :delete_timestamp,
      :tag_list)
      SENSITIVE = []
      include Aws::Structure
    end

    # A policy that defines the number of days to retain backups.
    #
    # @note When making an API call, you may pass BackupRetentionPolicy
    #   data as a hash:
    #
    #       {
    #         type: "DAYS", # accepts DAYS
    #         value: "BackupRetentionValue",
    #       }
    #
    # @!attribute [rw] type
    #   The type of backup retention policy. For the `DAYS` type, the value
    #   is the number of days to retain backups.
    #   @return [String]
    #
    # @!attribute [rw] value
    #   Use a value between 7 - 379.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/BackupRetentionPolicy AWS API Documentation
    #
    class BackupRetentionPolicy < Struct.new(
      :type,
      :value)
      SENSITIVE = []
      include Aws::Structure
    end

    # Contains one or more certificates or a certificate signing request
    # (CSR).
    #
    # @!attribute [rw] cluster_csr
    #   The cluster's certificate signing request (CSR). The CSR exists
    #   only when the cluster's state is `UNINITIALIZED`.
    #   @return [String]
    #
    # @!attribute [rw] hsm_certificate
    #   The HSM certificate issued (signed) by the HSM hardware.
    #   @return [String]
    #
    # @!attribute [rw] aws_hardware_certificate
    #   The HSM hardware certificate issued (signed) by AWS CloudHSM.
    #   @return [String]
    #
    # @!attribute [rw] manufacturer_hardware_certificate
    #   The HSM hardware certificate issued (signed) by the hardware
    #   manufacturer.
    #   @return [String]
    #
    # @!attribute [rw] cluster_certificate
    #   The cluster certificate issued (signed) by the issuing certificate
    #   authority (CA) of the cluster's owner.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/Certificates AWS API Documentation
    #
    class Certificates < Struct.new(
      :cluster_csr,
      :hsm_certificate,
      :aws_hardware_certificate,
      :manufacturer_hardware_certificate,
      :cluster_certificate)
      SENSITIVE = []
      include Aws::Structure
    end

    # The request was rejected because the requester does not have
    # permission to perform the requested operation.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/CloudHsmAccessDeniedException AWS API Documentation
    #
    class CloudHsmAccessDeniedException < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # The request was rejected because of an AWS CloudHSM internal failure.
    # The request can be retried.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/CloudHsmInternalFailureException AWS API Documentation
    #
    class CloudHsmInternalFailureException < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # The request was rejected because it is not a valid request.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/CloudHsmInvalidRequestException AWS API Documentation
    #
    class CloudHsmInvalidRequestException < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # The request was rejected because it refers to a resource that cannot
    # be found.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/CloudHsmResourceNotFoundException AWS API Documentation
    #
    class CloudHsmResourceNotFoundException < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # The request was rejected because an error occurred.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/CloudHsmServiceException AWS API Documentation
    #
    class CloudHsmServiceException < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # The request was rejected because of a tagging failure. Verify the tag
    # conditions in all applicable policies, and then retry the request.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/CloudHsmTagException AWS API Documentation
    #
    class CloudHsmTagException < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # Contains information about an AWS CloudHSM cluster.
    #
    # @!attribute [rw] backup_policy
    #   The cluster's backup policy.
    #   @return [String]
    #
    # @!attribute [rw] backup_retention_policy
    #   A policy that defines how the service retains backups.
    #   @return [Types::BackupRetentionPolicy]
    #
    # @!attribute [rw] cluster_id
    #   The cluster's identifier (ID).
    #   @return [String]
    #
    # @!attribute [rw] create_timestamp
    #   The date and time when the cluster was created.
    #   @return [Time]
    #
    # @!attribute [rw] hsms
    #   Contains information about the HSMs in the cluster.
    #   @return [Array<Types::Hsm>]
    #
    # @!attribute [rw] hsm_type
    #   The type of HSM that the cluster contains.
    #   @return [String]
    #
    # @!attribute [rw] pre_co_password
    #   The default password for the cluster's Pre-Crypto Officer (PRECO)
    #   user.
    #   @return [String]
    #
    # @!attribute [rw] security_group
    #   The identifier (ID) of the cluster's security group.
    #   @return [String]
    #
    # @!attribute [rw] source_backup_id
    #   The identifier (ID) of the backup used to create the cluster. This
    #   value exists only when the cluster was created from a backup.
    #   @return [String]
    #
    # @!attribute [rw] state
    #   The cluster's state.
    #   @return [String]
    #
    # @!attribute [rw] state_message
    #   A description of the cluster's state.
    #   @return [String]
    #
    # @!attribute [rw] subnet_mapping
    #   A map from availability zone to the cluster’s subnet in that
    #   availability zone.
    #   @return [Hash<String,String>]
    #
    # @!attribute [rw] vpc_id
    #   The identifier (ID) of the virtual private cloud (VPC) that contains
    #   the cluster.
    #   @return [String]
    #
    # @!attribute [rw] certificates
    #   Contains one or more certificates or a certificate signing request
    #   (CSR).
    #   @return [Types::Certificates]
    #
    # @!attribute [rw] tag_list
    #   The list of tags for the cluster.
    #   @return [Array<Types::Tag>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/Cluster AWS API Documentation
    #
    class Cluster < Struct.new(
      :backup_policy,
      :backup_retention_policy,
      :cluster_id,
      :create_timestamp,
      :hsms,
      :hsm_type,
      :pre_co_password,
      :security_group,
      :source_backup_id,
      :state,
      :state_message,
      :subnet_mapping,
      :vpc_id,
      :certificates,
      :tag_list)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass CopyBackupToRegionRequest
    #   data as a hash:
    #
    #       {
    #         destination_region: "Region", # required
    #         backup_id: "BackupId", # required
    #         tag_list: [
    #           {
    #             key: "TagKey", # required
    #             value: "TagValue", # required
    #           },
    #         ],
    #       }
    #
    # @!attribute [rw] destination_region
    #   The AWS region that will contain your copied CloudHSM cluster
    #   backup.
    #   @return [String]
    #
    # @!attribute [rw] backup_id
    #   The ID of the backup that will be copied to the destination region.
    #   @return [String]
    #
    # @!attribute [rw] tag_list
    #   Tags to apply to the destination backup during creation. If you
    #   specify tags, only these tags will be applied to the destination
    #   backup. If you do not specify tags, the service copies tags from the
    #   source backup to the destination backup.
    #   @return [Array<Types::Tag>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/CopyBackupToRegionRequest AWS API Documentation
    #
    class CopyBackupToRegionRequest < Struct.new(
      :destination_region,
      :backup_id,
      :tag_list)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] destination_backup
    #   Information on the backup that will be copied to the destination
    #   region, including CreateTimestamp, SourceBackup, SourceCluster, and
    #   Source Region. CreateTimestamp of the destination backup will be the
    #   same as that of the source backup.
    #
    #   You will need to use the `sourceBackupID` returned in this operation
    #   to use the DescribeBackups operation on the backup that will be
    #   copied to the destination region.
    #   @return [Types::DestinationBackup]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/CopyBackupToRegionResponse AWS API Documentation
    #
    class CopyBackupToRegionResponse < Struct.new(
      :destination_backup)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass CreateClusterRequest
    #   data as a hash:
    #
    #       {
    #         backup_retention_policy: {
    #           type: "DAYS", # accepts DAYS
    #           value: "BackupRetentionValue",
    #         },
    #         hsm_type: "HsmType", # required
    #         source_backup_id: "BackupId",
    #         subnet_ids: ["SubnetId"], # required
    #         tag_list: [
    #           {
    #             key: "TagKey", # required
    #             value: "TagValue", # required
    #           },
    #         ],
    #       }
    #
    # @!attribute [rw] backup_retention_policy
    #   A policy that defines how the service retains backups.
    #   @return [Types::BackupRetentionPolicy]
    #
    # @!attribute [rw] hsm_type
    #   The type of HSM to use in the cluster. Currently the only allowed
    #   value is `hsm1.medium`.
    #   @return [String]
    #
    # @!attribute [rw] source_backup_id
    #   The identifier (ID) of the cluster backup to restore. Use this value
    #   to restore the cluster from a backup instead of creating a new
    #   cluster. To find the backup ID, use DescribeBackups.
    #   @return [String]
    #
    # @!attribute [rw] subnet_ids
    #   The identifiers (IDs) of the subnets where you are creating the
    #   cluster. You must specify at least one subnet. If you specify
    #   multiple subnets, they must meet the following criteria:
    #
    #   * All subnets must be in the same virtual private cloud (VPC).
    #
    #   * You can specify only one subnet per Availability Zone.
    #   @return [Array<String>]
    #
    # @!attribute [rw] tag_list
    #   Tags to apply to the CloudHSM cluster during creation.
    #   @return [Array<Types::Tag>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/CreateClusterRequest AWS API Documentation
    #
    class CreateClusterRequest < Struct.new(
      :backup_retention_policy,
      :hsm_type,
      :source_backup_id,
      :subnet_ids,
      :tag_list)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] cluster
    #   Information about the cluster that was created.
    #   @return [Types::Cluster]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/CreateClusterResponse AWS API Documentation
    #
    class CreateClusterResponse < Struct.new(
      :cluster)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass CreateHsmRequest
    #   data as a hash:
    #
    #       {
    #         cluster_id: "ClusterId", # required
    #         availability_zone: "ExternalAz", # required
    #         ip_address: "IpAddress",
    #       }
    #
    # @!attribute [rw] cluster_id
    #   The identifier (ID) of the HSM's cluster. To find the cluster ID,
    #   use DescribeClusters.
    #   @return [String]
    #
    # @!attribute [rw] availability_zone
    #   The Availability Zone where you are creating the HSM. To find the
    #   cluster's Availability Zones, use DescribeClusters.
    #   @return [String]
    #
    # @!attribute [rw] ip_address
    #   The HSM's IP address. If you specify an IP address, use an
    #   available address from the subnet that maps to the Availability Zone
    #   where you are creating the HSM. If you don't specify an IP address,
    #   one is chosen for you from that subnet.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/CreateHsmRequest AWS API Documentation
    #
    class CreateHsmRequest < Struct.new(
      :cluster_id,
      :availability_zone,
      :ip_address)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] hsm
    #   Information about the HSM that was created.
    #   @return [Types::Hsm]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/CreateHsmResponse AWS API Documentation
    #
    class CreateHsmResponse < Struct.new(
      :hsm)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass DeleteBackupRequest
    #   data as a hash:
    #
    #       {
    #         backup_id: "BackupId", # required
    #       }
    #
    # @!attribute [rw] backup_id
    #   The ID of the backup to be deleted. To find the ID of a backup, use
    #   the DescribeBackups operation.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/DeleteBackupRequest AWS API Documentation
    #
    class DeleteBackupRequest < Struct.new(
      :backup_id)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] backup
    #   Information on the `Backup` object deleted.
    #   @return [Types::Backup]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/DeleteBackupResponse AWS API Documentation
    #
    class DeleteBackupResponse < Struct.new(
      :backup)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass DeleteClusterRequest
    #   data as a hash:
    #
    #       {
    #         cluster_id: "ClusterId", # required
    #       }
    #
    # @!attribute [rw] cluster_id
    #   The identifier (ID) of the cluster that you are deleting. To find
    #   the cluster ID, use DescribeClusters.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/DeleteClusterRequest AWS API Documentation
    #
    class DeleteClusterRequest < Struct.new(
      :cluster_id)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] cluster
    #   Information about the cluster that was deleted.
    #   @return [Types::Cluster]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/DeleteClusterResponse AWS API Documentation
    #
    class DeleteClusterResponse < Struct.new(
      :cluster)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass DeleteHsmRequest
    #   data as a hash:
    #
    #       {
    #         cluster_id: "ClusterId", # required
    #         hsm_id: "HsmId",
    #         eni_id: "EniId",
    #         eni_ip: "IpAddress",
    #       }
    #
    # @!attribute [rw] cluster_id
    #   The identifier (ID) of the cluster that contains the HSM that you
    #   are deleting.
    #   @return [String]
    #
    # @!attribute [rw] hsm_id
    #   The identifier (ID) of the HSM that you are deleting.
    #   @return [String]
    #
    # @!attribute [rw] eni_id
    #   The identifier (ID) of the elastic network interface (ENI) of the
    #   HSM that you are deleting.
    #   @return [String]
    #
    # @!attribute [rw] eni_ip
    #   The IP address of the elastic network interface (ENI) of the HSM
    #   that you are deleting.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/DeleteHsmRequest AWS API Documentation
    #
    class DeleteHsmRequest < Struct.new(
      :cluster_id,
      :hsm_id,
      :eni_id,
      :eni_ip)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] hsm_id
    #   The identifier (ID) of the HSM that was deleted.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/DeleteHsmResponse AWS API Documentation
    #
    class DeleteHsmResponse < Struct.new(
      :hsm_id)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass DescribeBackupsRequest
    #   data as a hash:
    #
    #       {
    #         next_token: "NextToken",
    #         max_results: 1,
    #         filters: {
    #           "Field" => ["String"],
    #         },
    #         sort_ascending: false,
    #       }
    #
    # @!attribute [rw] next_token
    #   The `NextToken` value that you received in the previous response.
    #   Use this value to get more backups.
    #   @return [String]
    #
    # @!attribute [rw] max_results
    #   The maximum number of backups to return in the response. When there
    #   are more backups than the number you specify, the response contains
    #   a `NextToken` value.
    #   @return [Integer]
    #
    # @!attribute [rw] filters
    #   One or more filters to limit the items returned in the response.
    #
    #   Use the `backupIds` filter to return only the specified backups.
    #   Specify backups by their backup identifier (ID).
    #
    #   Use the `sourceBackupIds` filter to return only the backups created
    #   from a source backup. The `sourceBackupID` of a source backup is
    #   returned by the CopyBackupToRegion operation.
    #
    #   Use the `clusterIds` filter to return only the backups for the
    #   specified clusters. Specify clusters by their cluster identifier
    #   (ID).
    #
    #   Use the `states` filter to return only backups that match the
    #   specified state.
    #
    #   Use the `neverExpires` filter to return backups filtered by the
    #   value in the `neverExpires` parameter. `True` returns all backups
    #   exempt from the backup retention policy. `False` returns all backups
    #   with a backup retention policy defined at the cluster.
    #   @return [Hash<String,Array<String>>]
    #
    # @!attribute [rw] sort_ascending
    #   Designates whether or not to sort the return backups by ascending
    #   chronological order of generation.
    #   @return [Boolean]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/DescribeBackupsRequest AWS API Documentation
    #
    class DescribeBackupsRequest < Struct.new(
      :next_token,
      :max_results,
      :filters,
      :sort_ascending)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] backups
    #   A list of backups.
    #   @return [Array<Types::Backup>]
    #
    # @!attribute [rw] next_token
    #   An opaque string that indicates that the response contains only a
    #   subset of backups. Use this value in a subsequent `DescribeBackups`
    #   request to get more backups.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/DescribeBackupsResponse AWS API Documentation
    #
    class DescribeBackupsResponse < Struct.new(
      :backups,
      :next_token)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass DescribeClustersRequest
    #   data as a hash:
    #
    #       {
    #         filters: {
    #           "Field" => ["String"],
    #         },
    #         next_token: "NextToken",
    #         max_results: 1,
    #       }
    #
    # @!attribute [rw] filters
    #   One or more filters to limit the items returned in the response.
    #
    #   Use the `clusterIds` filter to return only the specified clusters.
    #   Specify clusters by their cluster identifier (ID).
    #
    #   Use the `vpcIds` filter to return only the clusters in the specified
    #   virtual private clouds (VPCs). Specify VPCs by their VPC identifier
    #   (ID).
    #
    #   Use the `states` filter to return only clusters that match the
    #   specified state.
    #   @return [Hash<String,Array<String>>]
    #
    # @!attribute [rw] next_token
    #   The `NextToken` value that you received in the previous response.
    #   Use this value to get more clusters.
    #   @return [String]
    #
    # @!attribute [rw] max_results
    #   The maximum number of clusters to return in the response. When there
    #   are more clusters than the number you specify, the response contains
    #   a `NextToken` value.
    #   @return [Integer]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/DescribeClustersRequest AWS API Documentation
    #
    class DescribeClustersRequest < Struct.new(
      :filters,
      :next_token,
      :max_results)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] clusters
    #   A list of clusters.
    #   @return [Array<Types::Cluster>]
    #
    # @!attribute [rw] next_token
    #   An opaque string that indicates that the response contains only a
    #   subset of clusters. Use this value in a subsequent
    #   `DescribeClusters` request to get more clusters.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/DescribeClustersResponse AWS API Documentation
    #
    class DescribeClustersResponse < Struct.new(
      :clusters,
      :next_token)
      SENSITIVE = []
      include Aws::Structure
    end

    # Contains information about the backup that will be copied and created
    # by the CopyBackupToRegion operation.
    #
    # @!attribute [rw] create_timestamp
    #   The date and time when both the source backup was created.
    #   @return [Time]
    #
    # @!attribute [rw] source_region
    #   The AWS region that contains the source backup from which the new
    #   backup was copied.
    #   @return [String]
    #
    # @!attribute [rw] source_backup
    #   The identifier (ID) of the source backup from which the new backup
    #   was copied.
    #   @return [String]
    #
    # @!attribute [rw] source_cluster
    #   The identifier (ID) of the cluster containing the source backup from
    #   which the new backup was copied.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/DestinationBackup AWS API Documentation
    #
    class DestinationBackup < Struct.new(
      :create_timestamp,
      :source_region,
      :source_backup,
      :source_cluster)
      SENSITIVE = []
      include Aws::Structure
    end

    # Contains information about a hardware security module (HSM) in an AWS
    # CloudHSM cluster.
    #
    # @!attribute [rw] availability_zone
    #   The Availability Zone that contains the HSM.
    #   @return [String]
    #
    # @!attribute [rw] cluster_id
    #   The identifier (ID) of the cluster that contains the HSM.
    #   @return [String]
    #
    # @!attribute [rw] subnet_id
    #   The subnet that contains the HSM's elastic network interface (ENI).
    #   @return [String]
    #
    # @!attribute [rw] eni_id
    #   The identifier (ID) of the HSM's elastic network interface (ENI).
    #   @return [String]
    #
    # @!attribute [rw] eni_ip
    #   The IP address of the HSM's elastic network interface (ENI).
    #   @return [String]
    #
    # @!attribute [rw] hsm_id
    #   The HSM's identifier (ID).
    #   @return [String]
    #
    # @!attribute [rw] state
    #   The HSM's state.
    #   @return [String]
    #
    # @!attribute [rw] state_message
    #   A description of the HSM's state.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/Hsm AWS API Documentation
    #
    class Hsm < Struct.new(
      :availability_zone,
      :cluster_id,
      :subnet_id,
      :eni_id,
      :eni_ip,
      :hsm_id,
      :state,
      :state_message)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass InitializeClusterRequest
    #   data as a hash:
    #
    #       {
    #         cluster_id: "ClusterId", # required
    #         signed_cert: "Cert", # required
    #         trust_anchor: "Cert", # required
    #       }
    #
    # @!attribute [rw] cluster_id
    #   The identifier (ID) of the cluster that you are claiming. To find
    #   the cluster ID, use DescribeClusters.
    #   @return [String]
    #
    # @!attribute [rw] signed_cert
    #   The cluster certificate issued (signed) by your issuing certificate
    #   authority (CA). The certificate must be in PEM format and can
    #   contain a maximum of 5000 characters.
    #   @return [String]
    #
    # @!attribute [rw] trust_anchor
    #   The issuing certificate of the issuing certificate authority (CA)
    #   that issued (signed) the cluster certificate. You must use a
    #   self-signed certificate. The certificate used to sign the HSM CSR
    #   must be directly available, and thus must be the root certificate.
    #   The certificate must be in PEM format and can contain a maximum of
    #   5000 characters.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/InitializeClusterRequest AWS API Documentation
    #
    class InitializeClusterRequest < Struct.new(
      :cluster_id,
      :signed_cert,
      :trust_anchor)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] state
    #   The cluster's state.
    #   @return [String]
    #
    # @!attribute [rw] state_message
    #   A description of the cluster's state.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/InitializeClusterResponse AWS API Documentation
    #
    class InitializeClusterResponse < Struct.new(
      :state,
      :state_message)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass ListTagsRequest
    #   data as a hash:
    #
    #       {
    #         resource_id: "ResourceId", # required
    #         next_token: "NextToken",
    #         max_results: 1,
    #       }
    #
    # @!attribute [rw] resource_id
    #   The cluster identifier (ID) for the cluster whose tags you are
    #   getting. To find the cluster ID, use DescribeClusters.
    #   @return [String]
    #
    # @!attribute [rw] next_token
    #   The `NextToken` value that you received in the previous response.
    #   Use this value to get more tags.
    #   @return [String]
    #
    # @!attribute [rw] max_results
    #   The maximum number of tags to return in the response. When there are
    #   more tags than the number you specify, the response contains a
    #   `NextToken` value.
    #   @return [Integer]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/ListTagsRequest AWS API Documentation
    #
    class ListTagsRequest < Struct.new(
      :resource_id,
      :next_token,
      :max_results)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] tag_list
    #   A list of tags.
    #   @return [Array<Types::Tag>]
    #
    # @!attribute [rw] next_token
    #   An opaque string that indicates that the response contains only a
    #   subset of tags. Use this value in a subsequent `ListTags` request to
    #   get more tags.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/ListTagsResponse AWS API Documentation
    #
    class ListTagsResponse < Struct.new(
      :tag_list,
      :next_token)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass ModifyBackupAttributesRequest
    #   data as a hash:
    #
    #       {
    #         backup_id: "BackupId", # required
    #         never_expires: false, # required
    #       }
    #
    # @!attribute [rw] backup_id
    #   The identifier (ID) of the backup to modify. To find the ID of a
    #   backup, use the DescribeBackups operation.
    #   @return [String]
    #
    # @!attribute [rw] never_expires
    #   Specifies whether the service should exempt a backup from the
    #   retention policy for the cluster. `True` exempts a backup from the
    #   retention policy. `False` means the service applies the backup
    #   retention policy defined at the cluster.
    #   @return [Boolean]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/ModifyBackupAttributesRequest AWS API Documentation
    #
    class ModifyBackupAttributesRequest < Struct.new(
      :backup_id,
      :never_expires)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] backup
    #   Contains information about a backup of an AWS CloudHSM cluster. All
    #   backup objects contain the `BackupId`, `BackupState`, `ClusterId`,
    #   and `CreateTimestamp` parameters. Backups that were copied into a
    #   destination region additionally contain the `CopyTimestamp`,
    #   `SourceBackup`, `SourceCluster`, and `SourceRegion` parameters. A
    #   backup that is pending deletion will include the `DeleteTimestamp`
    #   parameter.
    #   @return [Types::Backup]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/ModifyBackupAttributesResponse AWS API Documentation
    #
    class ModifyBackupAttributesResponse < Struct.new(
      :backup)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass ModifyClusterRequest
    #   data as a hash:
    #
    #       {
    #         backup_retention_policy: { # required
    #           type: "DAYS", # accepts DAYS
    #           value: "BackupRetentionValue",
    #         },
    #         cluster_id: "ClusterId", # required
    #       }
    #
    # @!attribute [rw] backup_retention_policy
    #   A policy that defines how the service retains backups.
    #   @return [Types::BackupRetentionPolicy]
    #
    # @!attribute [rw] cluster_id
    #   The identifier (ID) of the cluster that you want to modify. To find
    #   the cluster ID, use DescribeClusters.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/ModifyClusterRequest AWS API Documentation
    #
    class ModifyClusterRequest < Struct.new(
      :backup_retention_policy,
      :cluster_id)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] cluster
    #   Contains information about an AWS CloudHSM cluster.
    #   @return [Types::Cluster]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/ModifyClusterResponse AWS API Documentation
    #
    class ModifyClusterResponse < Struct.new(
      :cluster)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass RestoreBackupRequest
    #   data as a hash:
    #
    #       {
    #         backup_id: "BackupId", # required
    #       }
    #
    # @!attribute [rw] backup_id
    #   The ID of the backup to be restored. To find the ID of a backup, use
    #   the DescribeBackups operation.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/RestoreBackupRequest AWS API Documentation
    #
    class RestoreBackupRequest < Struct.new(
      :backup_id)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] backup
    #   Information on the `Backup` object created.
    #   @return [Types::Backup]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/RestoreBackupResponse AWS API Documentation
    #
    class RestoreBackupResponse < Struct.new(
      :backup)
      SENSITIVE = []
      include Aws::Structure
    end

    # Contains a tag. A tag is a key-value pair.
    #
    # @note When making an API call, you may pass Tag
    #   data as a hash:
    #
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       }
    #
    # @!attribute [rw] key
    #   The key of the tag.
    #   @return [String]
    #
    # @!attribute [rw] value
    #   The value of the tag.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/Tag AWS API Documentation
    #
    class Tag < Struct.new(
      :key,
      :value)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass TagResourceRequest
    #   data as a hash:
    #
    #       {
    #         resource_id: "ResourceId", # required
    #         tag_list: [ # required
    #           {
    #             key: "TagKey", # required
    #             value: "TagValue", # required
    #           },
    #         ],
    #       }
    #
    # @!attribute [rw] resource_id
    #   The cluster identifier (ID) for the cluster that you are tagging. To
    #   find the cluster ID, use DescribeClusters.
    #   @return [String]
    #
    # @!attribute [rw] tag_list
    #   A list of one or more tags.
    #   @return [Array<Types::Tag>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/TagResourceRequest AWS API Documentation
    #
    class TagResourceRequest < Struct.new(
      :resource_id,
      :tag_list)
      SENSITIVE = []
      include Aws::Structure
    end

    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/TagResourceResponse AWS API Documentation
    #
    class TagResourceResponse < Aws::EmptyStructure; end

    # @note When making an API call, you may pass UntagResourceRequest
    #   data as a hash:
    #
    #       {
    #         resource_id: "ResourceId", # required
    #         tag_key_list: ["TagKey"], # required
    #       }
    #
    # @!attribute [rw] resource_id
    #   The cluster identifier (ID) for the cluster whose tags you are
    #   removing. To find the cluster ID, use DescribeClusters.
    #   @return [String]
    #
    # @!attribute [rw] tag_key_list
    #   A list of one or more tag keys for the tags that you are removing.
    #   Specify only the tag keys, not the tag values.
    #   @return [Array<String>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/UntagResourceRequest AWS API Documentation
    #
    class UntagResourceRequest < Struct.new(
      :resource_id,
      :tag_key_list)
      SENSITIVE = []
      include Aws::Structure
    end

    # @see http://docs.aws.amazon.com/goto/WebAPI/cloudhsmv2-2017-04-28/UntagResourceResponse AWS API Documentation
    #
    class UntagResourceResponse < Aws::EmptyStructure; end

  end
end
