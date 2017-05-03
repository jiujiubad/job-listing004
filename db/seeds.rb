# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Hello World!'
puts '這個種子檔會自動建立一個帳號, 並且随机創建 10 個jobs，10个隐藏的jobs'

create_account = User.create([email: 'example@gmail.com', password: '12345678',
  password_confirmation: '12345678', is_admin: 'true'])
puts 'Admin account is created successfully!'

job_title = [
  '程序员',
  '产品经理',
  '设计师',
  '运营',
  '市场与销售',
  '职能',
  '金融',
  '游戏测试',
  '移动互联网开发',
  'IT技术总监',
  'RoR工程师',
  '文案设计',
  'UI设计师',
  'Android开发工程师',
  '产品经理',
  '前端开发工程师',
  '市场营销',
  'php后台研发工程师',
  'python工程师',
  '高级JAVA研发工程师',
  '高级数据挖掘工程师',
  '高级客服经理'
]
job_description = [
'
1. 管理及维护公司SAP系统开发程序的正常运行；
2. 负责SAP报表、功能模块等增强性开发；
3. 负责SAP系统与外部系统的接口开发；
4. 负责SAP系统功能及报表的优化；
5. 协助应用顾问解决SAP报表或系统的异常；
',
'1、从事淘宝美工或相关工作经验1年以上；
2、熟练使用Photoshop、Flash、fireworks、Dreamweaver等常用设计制作软件；
3、工作认真，有责任心，踏实肯干，富有团队精神；
薪资待遇：薪资待遇：试用期1个月，3000元，试用期后：4000元左右，能力高者可更多，视工作能力而定。工作满3个月交社保，每月休息4天，其他国家法定节假日正常休息。有餐补。
',
'
1、进行系统的设计，完成游戏系统的开发、打磨、上线运营全过程；
2、从整体出发，进行模块设计、策划方案的撰写，并能根据研发、运营的实际情况进行调研、论证和优化，保证产品中长期发展；
3、推动相关同事使策划方案转变为现实，包括但不限于：方案评审，配合程序的开发，联调测试，提交相关策划资源，配合 QA的测试，对功能进行再次审核等；
4、对竞品类似系统分析、整理、归纳、总结；
5、负责相关市场产品的数值分析工作及与数值相关的系统策划案的撰写工作。
',
'
1、 基于公司战略及用户体验设计理念，结合用户需求和产品技术架构，完成产品/功能的概念设计和原型展示；
2、 交付开发和测试团队的产品需求文档，功能定义，视觉设计，交互设计等设计文档；
3、 跟踪产品开发进度，完成产品的开发、测试、版本管理，评审发布，产品上线等相关工作；
4、 协同研发团队监督确保产品开发的合理架构、优化方案、资源落实和项目进度；
5、 跟踪上线产品的市场效果、用户反馈，收集和主动挖掘改进需求，根据业务需要持续改进产品；
6、 包装产品功能，编写包装策划方案和推广渠道分析，制定有效的产品推广计划；
',
'
1、全面负责新产品与新技术的研究与开发工作，全面负责公司的技术研发与项目开发工作，并推进项目的工艺、技术进步和改造；
2、参与解决公司研发和生产方面的重大疑难问题；
3、根据公司总体规划和生产需要提出开发立项，并组织人员进行可行性论证，提交领导决策；
4、组织实施对项目的各个阶段的检查与验收工作；
5、根据公司总体规划和市场需要提出研制计划、采购计划及生产计划；
6、根据公司发展战略和业绩指标，制定研发中心目标并组织规划与落实；
7、管理研发团队，内部建设、岗位定岗、岗位职责定责、员工考核、队伍建设，分配研发人员工作任务；
8、监控项目的开发进度，确保研发过程及项目进度受控，把握关键节点并对开发过程中的重大事项进行处理与决策；
9、监督实施公司质量体系对研发工作的指导与规范。
',
'1、负责手机游戏功能性测试、专项测试（性能、安全、网络）；
2、负责撰写测试计划、测试用例、测试报告；
3、跟踪测试问题的解决状态；
4、把控产品测试进度，并确保产品质量；
5、通过各种渠道收集与本公司游戏、网站等有关的问题，并尽量重现问题。
',
]


job_city = [
  '广州',
  '深圳',
  '上海',
  '北京',
  '重庆',
  '武汉',
  '杭州',
  '西安',
  '台湾'
]

for i in 1..10 do
  Job.create!([title: job_title[rand(job_title.length)], city: job_city[rand(job_city.length)],
  description: job_description[rand(job_description.length)], wage_upper_bound: rand(40..79) * 1000,
  wage_lower_bound: rand(20..39) * 1000, is_hidden: 'false'])
end
for i in 1..10 do
  Job.create!([title: job_title[rand(job_title.length)], city: job_city[rand(job_city.length)],
  description: job_description[rand(job_description.length)], wage_upper_bound: rand(40..79) * 1000,
  wage_lower_bound: rand(20..39) * 1000, is_hidden: 'true'])
end



puts '10 Public jobs created.'
puts '10 Hidden jobs created.'
