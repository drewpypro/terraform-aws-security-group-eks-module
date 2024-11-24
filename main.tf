provider "aws" {
  region = var.aws_region
}

module "vpce_sg_module" {
  source = "./modules/vpce-module-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    app1_lambda         = module.app1_lambda.app1_lambda_sg_id
    app2_lambda         = module.app2_lambda.app2_lambda_sg_id
    cluster_endpoint    = module.cluster_endpoint.cluster_endpoint_sg_id
    dms                 = module.dms.dms_sg_id
    efs_mount_endpoint  = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    elastic_cache       = module.elastic_cache.elastic_cache_sg_id
    internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    internet_nlb        = module.internet_nlb.internet_nlb_sg_id
    istio_node          = module.istio_node.istio_node_sg_id
    msk                 = module.msk.msk_sg_id
    nlb                 = module.nlb.nlb_sg_id
    opensearch          = module.opensearch.opensearch_sg_id
    rds                 = module.rds.rds_sg_id
    worker_node         = module.worker_node.worker_node_sg_id
    # vpce_module_sg      = module.vpce_module_sg.vpc_module_sg_id
  }
}

module "app1_lambda" {
  source = "./modules/app1-lambda-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    # app1_lambda         = module.app1_lambda.app1_lambda_sg_id
    app2_lambda         = module.app2_lambda.app2_lambda_sg_id
    cluster_endpoint    = module.cluster_endpoint.cluster_endpoint_sg_id
    dms                 = module.dms.dms_sg_id
    efs_mount_endpoint  = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    elastic_cache       = module.elastic_cache.elastic_cache_sg_id
    internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    internet_nlb        = module.internet_nlb.internet_nlb_sg_id
    istio_node          = module.istio_node.istio_node_sg_id
    msk                 = module.msk.msk_sg_id
    nlb                 = module.nlb.nlb_sg_id
    opensearch          = module.opensearch.opensearch_sg_id
    rds                 = module.rds.rds_sg_id
    worker_node         = module.worker_node.worker_node_sg_id
    vpce_module_sg      = module.vpce_sg_module.vpce_sg_module_sg_id

  }
}

module "app2_lambda" {
  source = "./modules/app2-lambda-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    app1_lambda = module.app1_lambda.app1_lambda_sg_id
    # app2_lambda         = module.app2_lambda.app2_lambda_sg_id
    cluster_endpoint    = module.cluster_endpoint.cluster_endpoint_sg_id
    dms                 = module.dms.dms_sg_id
    efs_mount_endpoint  = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    elastic_cache       = module.elastic_cache.elastic_cache_sg_id
    internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    internet_nlb        = module.internet_nlb.internet_nlb_sg_id
    istio_node          = module.istio_node.istio_node_sg_id
    msk                 = module.msk.msk_sg_id
    nlb                 = module.nlb.nlb_sg_id
    opensearch          = module.opensearch.opensearch_sg_id
    rds                 = module.rds.rds_sg_id
    worker_node         = module.worker_node.worker_node_sg_id
    vpce_module_sg      = module.vpce_sg_module.vpce_sg_module_sg_id
  }
}

module "cluster_endpoint" {
  source = "./modules/cluster-endpoint-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    app1_lambda = module.app1_lambda.app1_lambda_sg_id
    app2_lambda = module.app2_lambda.app2_lambda_sg_id
    # cluster_endpoint    = module.cluster_endpoint.cluster_endpoint_sg_id
    dms                 = module.dms.dms_sg_id
    efs_mount_endpoint  = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    elastic_cache       = module.elastic_cache.elastic_cache_sg_id
    internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    internet_nlb        = module.internet_nlb.internet_nlb_sg_id
    istio_node          = module.istio_node.istio_node_sg_id
    msk                 = module.msk.msk_sg_id
    nlb                 = module.nlb.nlb_sg_id
    opensearch          = module.opensearch.opensearch_sg_id
    rds                 = module.rds.rds_sg_id
    worker_node         = module.worker_node.worker_node_sg_id
    vpce_module_sg      = module.vpce_sg_module.vpce_sg_module_sg_id
  }
}

module "dms" {
  source = "./modules/dms-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    app1_lambda      = module.app1_lambda.app1_lambda_sg_id
    app2_lambda      = module.app2_lambda.app2_lambda_sg_id
    cluster_endpoint = module.cluster_endpoint.cluster_endpoint_sg_id
    # dms                 = module.dms.dms_sg_id
    efs_mount_endpoint  = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    elastic_cache       = module.elastic_cache.elastic_cache_sg_id
    internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    internet_nlb        = module.internet_nlb.internet_nlb_sg_id
    istio_node          = module.istio_node.istio_node_sg_id
    msk                 = module.msk.msk_sg_id
    nlb                 = module.nlb.nlb_sg_id
    opensearch          = module.opensearch.opensearch_sg_id
    rds                 = module.rds.rds_sg_id
    worker_node         = module.worker_node.worker_node_sg_id
    vpce_module_sg      = module.vpce_sg_module.vpce_sg_module_sg_id
  }
}

module "efs_mount_endpoint" {
  source = "./modules/efs-mount-endpoint-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    app1_lambda      = module.app1_lambda.app1_lambda_sg_id
    app2_lambda      = module.app2_lambda.app2_lambda_sg_id
    cluster_endpoint = module.cluster_endpoint.cluster_endpoint_sg_id
    dms              = module.dms.dms_sg_id
    # efs_mount_endpoint  = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    elastic_cache       = module.elastic_cache.elastic_cache_sg_id
    internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    internet_nlb        = module.internet_nlb.internet_nlb_sg_id
    istio_node          = module.istio_node.istio_node_sg_id
    msk                 = module.msk.msk_sg_id
    nlb                 = module.nlb.nlb_sg_id
    opensearch          = module.opensearch.opensearch_sg_id
    rds                 = module.rds.rds_sg_id
    worker_node         = module.worker_node.worker_node_sg_id
    vpce_module_sg      = module.vpce_sg_module.vpce_sg_module_sg_id
  }
}

module "elastic_cache" {
  source = "./modules/elastic-cache-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    app1_lambda        = module.app1_lambda.app1_lambda_sg_id
    app2_lambda        = module.app2_lambda.app2_lambda_sg_id
    cluster_endpoint   = module.cluster_endpoint.cluster_endpoint_sg_id
    dms                = module.dms.dms_sg_id
    efs_mount_endpoint = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    # elastic_cache       = module.elastic_cache.elastic_cache_sg_id
    internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    internet_nlb        = module.internet_nlb.internet_nlb_sg_id
    istio_node          = module.istio_node.istio_node_sg_id
    msk                 = module.msk.msk_sg_id
    nlb                 = module.nlb.nlb_sg_id
    opensearch          = module.opensearch.opensearch_sg_id
    rds                 = module.rds.rds_sg_id
    worker_node         = module.worker_node.worker_node_sg_id
    vpce_module_sg      = module.vpce_sg_module.vpce_sg_module_sg_id
  }
}

module "internet_istio_node" {
  source = "./modules/internet-istio-node-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    app1_lambda        = module.app1_lambda.app1_lambda_sg_id
    app2_lambda        = module.app2_lambda.app2_lambda_sg_id
    cluster_endpoint   = module.cluster_endpoint.cluster_endpoint_sg_id
    dms                = module.dms.dms_sg_id
    efs_mount_endpoint = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    elastic_cache      = module.elastic_cache.elastic_cache_sg_id
    # internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    internet_nlb   = module.internet_nlb.internet_nlb_sg_id
    istio_node     = module.istio_node.istio_node_sg_id
    msk            = module.msk.msk_sg_id
    nlb            = module.nlb.nlb_sg_id
    opensearch     = module.opensearch.opensearch_sg_id
    rds            = module.rds.rds_sg_id
    worker_node    = module.worker_node.worker_node_sg_id
    vpce_module_sg = module.vpce_sg_module.vpce_sg_module_sg_id
  }
}

module "internet_nlb" {
  source = "./modules/internet-nlb-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    app1_lambda         = module.app1_lambda.app1_lambda_sg_id
    app2_lambda         = module.app2_lambda.app2_lambda_sg_id
    cluster_endpoint    = module.cluster_endpoint.cluster_endpoint_sg_id
    dms                 = module.dms.dms_sg_id
    efs_mount_endpoint  = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    elastic_cache       = module.elastic_cache.elastic_cache_sg_id
    internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    # internet_nlb        = module.internet_nlb.internet_nlb_sg_id
    istio_node     = module.istio_node.istio_node_sg_id
    msk            = module.msk.msk_sg_id
    nlb            = module.nlb.nlb_sg_id
    opensearch     = module.opensearch.opensearch_sg_id
    rds            = module.rds.rds_sg_id
    worker_node    = module.worker_node.worker_node_sg_id
    vpce_module_sg = module.vpce_sg_module.vpce_sg_module_sg_id
  }
}

module "istio_node" {
  source = "./modules/istio-node-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    app1_lambda         = module.app1_lambda.app1_lambda_sg_id
    app2_lambda         = module.app2_lambda.app2_lambda_sg_id
    cluster_endpoint    = module.cluster_endpoint.cluster_endpoint_sg_id
    dms                 = module.dms.dms_sg_id
    efs_mount_endpoint  = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    elastic_cache       = module.elastic_cache.elastic_cache_sg_id
    internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    internet_nlb        = module.internet_nlb.internet_nlb_sg_id
    # istio_node         = module.istio_node.istio_node_sg_id
    msk            = module.msk.msk_sg_id
    nlb            = module.nlb.nlb_sg_id
    opensearch     = module.opensearch.opensearch_sg_id
    rds            = module.rds.rds_sg_id
    worker_node    = module.worker_node.worker_node_sg_id
    vpce_module_sg = module.vpce_sg_module.vpce_sg_module_sg_id
  }
}

module "msk" {
  source = "./modules/msk-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    app1_lambda         = module.app1_lambda.app1_lambda_sg_id
    app2_lambda         = module.app2_lambda.app2_lambda_sg_id
    cluster_endpoint    = module.cluster_endpoint.cluster_endpoint_sg_id
    dms                 = module.dms.dms_sg_id
    efs_mount_endpoint  = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    elastic_cache       = module.elastic_cache.elastic_cache_sg_id
    internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    internet_nlb        = module.internet_nlb.internet_nlb_sg_id
    istio_node          = module.istio_node.istio_node_sg_id
    # msk                 = module.msk.msk_sg_id
    nlb            = module.nlb.nlb_sg_id
    opensearch     = module.opensearch.opensearch_sg_id
    rds            = module.rds.rds_sg_id
    worker_node    = module.worker_node.worker_node_sg_id
    vpce_module_sg = module.vpce_sg_module.vpce_sg_module_sg_id
  }
}

module "nlb" {
  source = "./modules/nlb-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    app1_lambda         = module.app1_lambda.app1_lambda_sg_id
    app2_lambda         = module.app2_lambda.app2_lambda_sg_id
    cluster_endpoint    = module.cluster_endpoint.cluster_endpoint_sg_id
    dms                 = module.dms.dms_sg_id
    efs_mount_endpoint  = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    elastic_cache       = module.elastic_cache.elastic_cache_sg_id
    internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    internet_nlb        = module.internet_nlb.internet_nlb_sg_id
    istio_node          = module.istio_node.istio_node_sg_id
    msk                 = module.msk.msk_sg_id
    # nlb                 = module.nlb.nlb_sg_id
    opensearch     = module.opensearch.opensearch_sg_id
    rds            = module.rds.rds_sg_id
    worker_node    = module.worker_node.worker_node_sg_id
    vpce_module_sg = module.vpce_sg_module.vpce_sg_module_sg_id
  }
}

module "opensearch" {
  source = "./modules/opensearch-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    app1_lambda         = module.app1_lambda.app1_lambda_sg_id
    app2_lambda         = module.app2_lambda.app2_lambda_sg_id
    cluster_endpoint    = module.cluster_endpoint.cluster_endpoint_sg_id
    dms                 = module.dms.dms_sg_id
    efs_mount_endpoint  = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    elastic_cache       = module.elastic_cache.elastic_cache_sg_id
    internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    internet_nlb        = module.internet_nlb.internet_nlb_sg_id
    istio_node          = module.istio_node.istio_node_sg_id
    msk                 = module.msk.msk_sg_id
    nlb                 = module.nlb.nlb_sg_id
    # opensearch          = module.opensearch.opensearch_sg_id
    rds            = module.rds.rds_sg_id
    worker_node    = module.worker_node.worker_node_sg_id
    vpce_module_sg = module.vpce_sg_module.vpce_sg_module_sg_id
  }
}

module "rds" {
  source = "./modules/rds-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    app1_lambda         = module.app1_lambda.app1_lambda_sg_id
    app2_lambda         = module.app2_lambda.app2_lambda_sg_id
    cluster_endpoint    = module.cluster_endpoint.cluster_endpoint_sg_id
    dms                 = module.dms.dms_sg_id
    efs_mount_endpoint  = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    elastic_cache       = module.elastic_cache.elastic_cache_sg_id
    internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    internet_nlb        = module.internet_nlb.internet_nlb_sg_id
    istio_node          = module.istio_node.istio_node_sg_id
    msk                 = module.msk.msk_sg_id
    nlb                 = module.nlb.nlb_sg_id
    opensearch          = module.opensearch.opensearch_sg_id
    # rds                 = module.rds.rds_sg_id
    worker_node    = module.worker_node.worker_node_sg_id
    vpce_module_sg = module.vpce_sg_module.vpce_sg_module_sg_id
  }
}

module "worker_node" {
  source = "./modules/worker-node-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
    app1_lambda         = module.app1_lambda.app1_lambda_sg_id
    app2_lambda         = module.app2_lambda.app2_lambda_sg_id
    cluster_endpoint    = module.cluster_endpoint.cluster_endpoint_sg_id
    dms                 = module.dms.dms_sg_id
    efs_mount_endpoint  = module.efs_mount_endpoint.efs_mount_endpoint_sg_id
    elastic_cache       = module.elastic_cache.elastic_cache_sg_id
    internet_istio_node = module.internet_istio_node.internet_istio_node_sg_id
    internet_nlb        = module.internet_nlb.internet_nlb_sg_id
    istio_node          = module.istio_node.istio_node_sg_id
    msk                 = module.msk.msk_sg_id
    nlb                 = module.nlb.nlb_sg_id
    opensearch          = module.opensearch.opensearch_sg_id
    rds                 = module.rds.rds_sg_id
    # worker_node         = module.worker_node.worker_node_sg_id
    vpce_module_sg = module.vpce_sg_module.vpce_sg_module_sg_id
  }
}
