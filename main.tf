provider "aws" {
  region = var.aws_region
}

module "vpce_module_sg" {
  source = "./modules/vpce-module-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  dms                 = module.dms.security_groups["dms"]
  efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  istio_node          = module.istio_node.security_groups["istio_node"]
  msk                 = module.msk.security_groups["msk"]
  nlb                 = module.nlb.security_groups["nlb"]
  opensearch          = module.opensearch.security_groups["opensearch"]
  rds                 = module.rds.security_groups["rds"]
  worker_node         = module.worker_node.security_groups["worker_node"]
  # vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]
  }
}

module "app1_lambda" {
  source = "./modules/app1-lambda-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  # app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  dms                 = module.dms.security_groups["dms"]
  efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  istio_node          = module.istio_node.security_groups["istio_node"]
  msk                 = module.msk.security_groups["msk"]
  nlb                 = module.nlb.security_groups["nlb"]
  opensearch          = module.opensearch.security_groups["opensearch"]
  rds                 = module.rds.security_groups["rds"]
  worker_node         = module.worker_node.security_groups["worker_node"]
  vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]

  }
}

module "app2_lambda" {
  source = "./modules/app2-lambda-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  # app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  dms                 = module.dms.security_groups["dms"]
  efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  istio_node          = module.istio_node.security_groups["istio_node"]
  msk                 = module.msk.security_groups["msk"]
  nlb                 = module.nlb.security_groups["nlb"]
  opensearch          = module.opensearch.security_groups["opensearch"]
  rds                 = module.rds.security_groups["rds"]
  worker_node         = module.worker_node.security_groups["worker_node"]
  vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]
  }
}

module "cluster_endpoint" {
  source = "./modules/cluster-endpoint-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  # cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  dms                 = module.dms.security_groups["dms"]
  efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  istio_node          = module.istio_node.security_groups["istio_node"]
  msk                 = module.msk.security_groups["msk"]
  nlb                 = module.nlb.security_groups["nlb"]
  opensearch          = module.opensearch.security_groups["opensearch"]
  rds                 = module.rds.security_groups["rds"]
  worker_node         = module.worker_node.security_groups["worker_node"]
  vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]
  }
}

module "dms" {
  source = "./modules/dms-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  # dms                 = module.dms.security_groups["dms"]
  efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  istio_node          = module.istio_node.security_groups["istio_node"]
  msk                 = module.msk.security_groups["msk"]
  nlb                 = module.nlb.security_groups["nlb"]
  opensearch          = module.opensearch.security_groups["opensearch"]
  rds                 = module.rds.security_groups["rds"]
  worker_node         = module.worker_node.security_groups["worker_node"]
  vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]
  }
}

module "efs_mount_endpoint" {
  source = "./modules/efs-mount-endpoint-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  dms                 = module.dms.security_groups["dms"]
  # efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  istio_node          = module.istio_node.security_groups["istio_node"]
  msk                 = module.msk.security_groups["msk"]
  nlb                 = module.nlb.security_groups["nlb"]
  opensearch          = module.opensearch.security_groups["opensearch"]
  rds                 = module.rds.security_groups["rds"]
  worker_node         = module.worker_node.security_groups["worker_node"]
  vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]
  }
}

module "elastic_cache" {
  source = "./modules/elastic-cache-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  dms                 = module.dms.security_groups["dms"]
  efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  # elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  istio_node          = module.istio_node.security_groups["istio_node"]
  msk                 = module.msk.security_groups["msk"]
  nlb                 = module.nlb.security_groups["nlb"]
  opensearch          = module.opensearch.security_groups["opensearch"]
  rds                 = module.rds.security_groups["rds"]
  worker_node         = module.worker_node.security_groups["worker_node"]
  vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]
  }
}

module "internet_istio_node" {
  source = "./modules/internet-istio-node-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  dms                 = module.dms.security_groups["dms"]
  efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  # internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  istio_node          = module.istio_node.security_groups["istio_node"]
  msk                 = module.msk.security_groups["msk"]
  nlb                 = module.nlb.security_groups["nlb"]
  opensearch          = module.opensearch.security_groups["opensearch"]
  rds                 = module.rds.security_groups["rds"]
  worker_node         = module.worker_node.security_groups["worker_node"]
  vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]
  }
}

module "internet_nlb" {
  source = "./modules/internet-nlb-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  dms                 = module.dms.security_groups["dms"]
  efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  # internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  istio_node          = module.istio_node.security_groups["istio_node"]
  msk                 = module.msk.security_groups["msk"]
  nlb                 = module.nlb.security_groups["nlb"]
  opensearch          = module.opensearch.security_groups["opensearch"]
  rds                 = module.rds.security_groups["rds"]
  worker_node         = module.worker_node.security_groups["worker_node"]
  vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]
  }
}

module "istio_node" {
  source = "./modules/istio-node-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  dms                 = module.dms.security_groups["dms"]
  efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  # istio_node          = module.istio_node.security_groups["istio_node"]
  msk                 = module.msk.security_groups["msk"]
  nlb                 = module.nlb.security_groups["nlb"]
  opensearch          = module.opensearch.security_groups["opensearch"]
  rds                 = module.rds.security_groups["rds"]
  worker_node         = module.worker_node.security_groups["worker_node"]
  vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]
  }
}

module "msk" {
  source = "./modules/msk-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  dms                 = module.dms.security_groups["dms"]
  efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  istio_node          = module.istio_node.security_groups["istio_node"]
  # msk                 = module.msk.security_groups["msk"]
  nlb                 = module.nlb.security_groups["nlb"]
  opensearch          = module.opensearch.security_groups["opensearch"]
  rds                 = module.rds.security_groups["rds"]
  worker_node         = module.worker_node.security_groups["worker_node"]
  vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]
  }
}

module "nlb" {
  source = "./modules/nlb-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  dms                 = module.dms.security_groups["dms"]
  efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  istio_node          = module.istio_node.security_groups["istio_node"]
  msk                 = module.msk.security_groups["msk"]
  # nlb                 = module.nlb.security_groups["nlb"]
  opensearch          = module.opensearch.security_groups["opensearch"]
  rds                 = module.rds.security_groups["rds"]
  worker_node         = module.worker_node.security_groups["worker_node"]
  vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]
  }
}

module "opensearch" {
  source = "./modules/opensearch-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  dms                 = module.dms.security_groups["dms"]
  efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  istio_node          = module.istio_node.security_groups["istio_node"]
  msk                 = module.msk.security_groups["msk"]
  nlb                 = module.nlb.security_groups["nlb"]
  # opensearch          = module.opensearch.security_groups["opensearch"]
  rds                 = module.rds.security_groups["rds"]
  worker_node         = module.worker_node.security_groups["worker_node"]
  vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]
  }
}

module "rds" {
  source = "./modules/rds-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  dms                 = module.dms.security_groups["dms"]
  efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  istio_node          = module.istio_node.security_groups["istio_node"]
  msk                 = module.msk.security_groups["msk"]
  nlb                 = module.nlb.security_groups["nlb"]
  opensearch          = module.opensearch.security_groups["opensearch"]
  # rds                 = module.rds.security_groups["rds"]
  worker_node         = module.worker_node.security_groups["worker_node"]
  vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]
  }
}

module "worker_node" {
  source = "./modules/worker-node-sg/"
  vpc_id = module.vpc.vpc_id

  services = var.services
  referenced_sg_ids = {
  app1_lambda         = module.app1_lambda.security_groups["app1_lambda"]
  app2_lambda         = module.app2_lambda.security_groups["app2_lambda"]
  cluster_endpoint    = module.cluster_endpoint.security_groups["cluster_endpoint"]
  dms                 = module.dms.security_groups["dms"]
  efs_mount_endpoint  = module.efs_mount_endpoint.security_groups["efs_mount_endpoint"]
  elastic_cache      = module.elastic_cache.security_groups["elastic_cache"]
  internet_istio_node = module.internet_istio_node.security_groups["internet_istio_node"]
  internet_nlb        = module.internet_nlb.security_groups["internet_nlb"]
  istio_node          = module.istio_node.security_groups["istio_node"]
  msk                 = module.msk.security_groups["msk"]
  nlb                 = module.nlb.security_groups["nlb"]
  opensearch          = module.opensearch.security_groups["opensearch"]
  rds                 = module.rds.security_groups["rds"]
  # worker_node         = module.worker_node.security_groups["worker_node"]
  vpce_module_sg      = module.vpce_module_sg.security_groups["vpce_module"]
  }
}
