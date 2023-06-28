# Terraform AWS Application Load Balancer (ALB)
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.6.1"

  name = "${local.name}-myALB-jass"

  load_balancer_type = "application"

  vpc_id = module.vpc.vpc_id
  subnets = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1]
  ]
  security_groups = [module.loadbalancer_sg.security_group_id]

  # Listeners
  http_tcp_listeners = [
    {
      port     = 80
      protocol = "HTTP"
     # target_group_index = 0
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  #target_Group
  target_groups = [
    # App1 Target Group - TG Index = 0
    {
      name_prefix          = "App1-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 5
        protocol            = "HTTP"
        matcher             = "200-399"
      }

      protocol_version = "HTTP1"
      # App1 Target Group - Targets
      targets = {
        my_app1_jass1 = {
          target_id = module.ec2_private_app1[0].id
          port      = 80
        }
        # my_app1_jass2 = {
        #   target_id = module.ec2_private_app1[1].id
        #   port      = 80
        # }
      }
      tags = local.common_tags
    },

    #tags = local.common_tags

    # App2 Target Group - TG Index = 1
    {
      name_prefix          = "App2-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app2/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      # App2 Target Group - Targets
      targets = {
        my_app2_jass1 = {
          target_id = module.ec2_private_app2[0].id
          port      = 80
        },
        # my_app2_jass2 = {
        #   target_id = module.ec2_private_app2[1].id
        #   port      = 80
        # }
      }
      tags = local.common_tags
    }
  ]

  # HTTPS Listener
  https_listeners = [
    # HTTPS Listener Index = 0 for HTTPS 443
    {
      port            = 443
      protocol        = "HTTPS"
      certificate_arn = module.acm.acm_certificate_arn
      action_type     = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "Hello Jasmeet Singh"
        status_code  = "200"
      }
    },
  ]

  # HTTPS Listener Rules
  https_listener_rules = [
    # Rule-1: /app1*
    {
      https_listener_index = 0
      priority             = 1

      actions = [
        {
          type               = "forward"
          target_group_index = 0
        }
      ]
      conditions = [{
        #path_patterns = ["/app1*"]
        host_headers = [var.app1_dns_name]
      }]
    },
    # Rule-2: /app2* 
    {
     https_listener_index = 0
     priority             = 2
      actions = [
        {
          type               = "forward"
         target_group_index = 1
        }
      ]
      conditions = [{
        #path_patterns = ["/app2*"]
        host_headers = [var.app2_dns_name]
      }]
    },

  ]
  tags = local.common_tags # ALB Tags
}
