var myChart = echarts.init(document.getElementById('main'));
		var myChart1 = echarts.init(document.getElementById('main1'));
		var myChart2 = echarts.init(document.getElementById('main2'));
		var myChart3 = echarts.init(document.getElementById('main3'));
        var optionDay = {    
//      	 title: {
//              text: '人员统计',      
//              left:"4%",
//              textStyle: {    
//	                color: "#ffffff",
//	                fontSize: 12,   
//              }
//         	},
            xAxis: {
                data: ["嫌疑人","受害人","证人","律师","监护人","翻译","其他"],
                axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
		            lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	         	 axisLabel: {
              		color: '#90a6b7',//坐标值的具体的颜色
              		fontSize:8,
              		interval:0
	          	}
            },
            yAxis: {
            	axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
//	            	show: false
					lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	          	axisLabel: {
	            	textStyle: {
	              		color: '#90a6b7',//坐标值的具体的颜色
	            	}
	          	},
	          	splitLine: {
	            	lineStyle: {
	              		color: ['transparent'],//分割线的颜色
	            	}
	          	}
            },
            series: [{          
                type: 'bar',
                data: [36, 11, 13, 4, 7, 0, 6],
                barWidth: 10, //设置柱子宽度，单位为px
		        itemStyle: {
		            normal: {
		              color: '#00FFFF',//设置柱子颜色
		            }
		        }
            }]
        };
		var optionWeek = { 
//			title: {
//              text: '人员统计',
//              left:"4%",
//              textStyle: {    
//	                color: "#ffffff",
//	                fontSize: 12,   
//              }
//          },
            xAxis: {
                data: ["嫌疑人","受害人","证人","律师","监护人","翻译","其他"],
                axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
		            lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	         	 axisLabel: {
              		color: '#90a6b7',//坐标值的具体的颜色
              		fontSize:8,
              		interval:0
	          	}
            },
            yAxis: {
            	axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
//	            	show: false
					lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	          	axisLabel: {
	            	textStyle: {
	              		color: '#90a6b7',//坐标值的具体的颜色
	            	}
	          	},
	          	splitLine: {
	            	lineStyle: {
	              		color: ['transparent'],//分割线的颜色
	            	}
	          	}
            },
            series: [{          
                type: 'bar',
                data: [252, 74, 91, 25, 46, 0, 41],
                barWidth: 10, //设置柱子宽度，单位为px
		        itemStyle: {
		            normal: {
		              color: '#00FFFF',//设置柱子颜色
		            }
		        }
            }]
        };
        var optionMonth = {  
//      	title: {
//              text: '人员统计',
//              left:"4%",
//              textStyle: {    
//	                color: "#ffffff",
//	                fontSize: 12,   
//              }
//          },
            xAxis: {
                data: ["嫌疑人","受害人","证人","律师","监护人","翻译","其他"],
                axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
		            lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	         	 axisLabel: {
              		color: '#90a6b7',//坐标值的具体的颜色
              		fontSize:8,
              		interval:0
	          	}
            },
            yAxis: {
            	axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
//	            	show: false
					lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	          	axisLabel: {
	            	textStyle: {
	              		color: '#90a6b7',//坐标值的具体的颜色
	            	}
	          	},
	          	splitLine: {
	            	lineStyle: {
	              		color: ['transparent'],//分割线的颜色
	            	}
	          	}
            },
            grid: {
		        left: 45
		    },
            series: [{          
                type: 'bar',
                data: [1079, 318, 392, 124, 221, 3, 184],
                barWidth: 10, //设置柱子宽度，单位为px
		        itemStyle: {
		            normal: {
		              color: '#00FFFF',//设置柱子颜色
		            }
		        }
            }]
        };
        var optionYear = {  
//      	title: {
//              text: '人员统计',
//              left:"4%",
//              textStyle: {    
//	                color: "#ffffff",
//	                fontSize: 12,   
//              }
//          },
            xAxis: {
                data: ["嫌疑人","受害人","证人","律师","监护人","翻译","其他"],
                axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
		            lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	         	 axisLabel: {
              		color: '#90a6b7',//坐标值的具体的颜色
              		fontSize:8,
              		interval:0
	          	}
            },
            yAxis: {
            	axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
//	            	show: false
					lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	          	axisLabel: {
	            	textStyle: {
	              		color: '#90a6b7',//坐标值的具体的颜色
	            	}
	          	},
	          	splitLine: {
	            	lineStyle: {
	              		color: ['transparent'],//分割线的颜色
	            	}
	          	}
            },
            grid: {
		        left: 45
		    },
            series: [{          
                type: 'bar',
                data: [12960, 3960, 4680, 1440, 2520, 16, 2160],
                barWidth: 10, //设置柱子宽度，单位为px
		        itemStyle: {
		            normal: {
		              color: '#00FFFF',//设置柱子颜色
		            }
		        }
            }]
        };
        var optionDate = {  
            xAxis: {
                data: ["嫌疑人","受害人","证人","律师","监护人","翻译","其他"],
                axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
		            lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	         	 axisLabel: {
              		color: '#90a6b7',//坐标值的具体的颜色
              		fontSize:8,
              		interval:0
	          	}
            },
            yAxis: {
            	axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
//	            	show: false
					lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	          	axisLabel: {
	            	textStyle: {
	              		color: '#90a6b7',//坐标值的具体的颜色
	            	}
	          	},
	          	splitLine: {
	            	lineStyle: {
	              		color: ['transparent'],//分割线的颜色
	            	}
	          	}
            },
            grid: {
		        left: 45
		    },
            series: [{          
                type: 'bar',
                data: [100, 230, 400, 560, 2000, 1600, 900],
                barWidth: 10, //设置柱子宽度，单位为px
		        itemStyle: {
		            normal: {
		              color: '#00FFFF',//设置柱子颜色
		            }
		        }
            }]
        };
		var videoOption = {
			 title: {
                text: '单位:个',
                top:'10%',
                textStyle: {    
	                color: "#ffffff",
	                fontSize: 10,   
                }
            },
            tooltip: {
                 trigger: "axis",  
            },
	        legend: {
	        	itemWidth:8,  
                itemHeight:8, 
                top:'10%',
                right:"6%",
	            data:['未关联','已关联'],
	            textStyle:{//图例文字的样式
		            color:'#ffffff',
		            fontSize:10
		        }
	        },
	        xAxis: {
	        	data: ["五谷城","吴仓堡","周湾","城镇","庙沟","新寨","王洼子","白豹","薛岔","铁边","长官","长城"],
	            axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
		            lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	         	 axisLabel: {
	          		color: '#90a6b7',//坐标值的具体的颜色
	          		fontSize:8,
	          		interval:0
	          	}
	        },
	        yAxis: {
	        	axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
//	            	show: false
					lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	          	axisLabel: {
	            	textStyle: {
	              		color: '#90a6b7',//坐标值的具体的颜色
	            	}
	          	},
	          	splitLine: {
	            	show:false,
	          	}
	        },
	        series: [
	        {
	            type: 'bar',
	            name:'已关联',
	            stack:'使用情况',
	            barWidth: 30, //设置柱子宽度，单位为px
		        itemStyle: {
		            normal: {
		              color: '#00FFFF',//设置柱子颜色		             
		            }
		        },
		        data: [0,0,0,0],
	        },
	        {
	            type: 'bar',
	            name:'未关联',
	            stack:'使用情况',
	            barWidth: 30, //设置柱子宽度，单位为px
		        itemStyle: {
		            normal: {
		              color: '#ffa602',//设置柱子颜色		            
		            }
		        },
		        data: [0,0,0,0],
	        },
	        ]
	    };
	    var optionDate1 = {
			 title: {
                text: '单位:个',
                top:'10%',
                textStyle: {    
	                color: "#ffffff",
	                fontSize: 10,   
                }
            },
            tooltip: {
                 trigger: "axis",  
            },
	        legend: {
	        	itemWidth:8,  
                itemHeight:8, 
                top:'10%',
                right:"6%",
	            data:['未关联','已关联'],
	            textStyle:{//图例文字的样式
		            color:'#ffffff',
		            fontSize:10
		        }
	        },
	        xAxis: {
	            data: ["五谷城","吴仓堡","周湾","城镇","庙沟","新寨","王洼子","白豹","薛岔","铁边","长官","长城"],
	            axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
		            lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	         	 axisLabel: {
	          		color: '#90a6b7',//坐标值的具体的颜色
	          		fontSize:8,
	          		interval:0
	          	}
	        },
	        yAxis: {
	        	axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
//	            	show: false
					lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	          	axisLabel: {
	            	textStyle: {
	              		color: '#90a6b7',//坐标值的具体的颜色
	            	}
	          	},
	          	splitLine: {
	            	show:false,
	          	}
	        },
	        grid: {
		        left: 45
		    },
	        series: [
	        {
	            type: 'bar',
	            name:'已关联',
	            stack:'使用情况',
	            barWidth: 10, //设置柱子宽度，单位为px
		        itemStyle: {
		            normal: {
		              color: '#00FFFF',//设置柱子颜色		             
		            }
		        },
		        data: [300, 160, 130, 220, 160, 100, 80, 50],
	        },
	        {
	            type: 'bar',
	            name:'未关联',
	            stack:'使用情况',
	            barWidth: 10, //设置柱子宽度，单位为px
		        itemStyle: {
		            normal: {
		              color: '#ffa602',//设置柱子颜色		            
		            }
		        },
		        data: [100, 60, 20, 40, 100, 30, 10, 40],
	        },
	        ]
	    };
		var optionDay2 = {
			tooltip: {
		        trigger: 'item',
		        formatter: '{b}:\n{c}%'
		   },
		    grid: {
		        left: 45
		    },
            xAxis: {
            	data: ["五谷城","吴仓堡","周湾","城镇","庙沟","新寨","王洼子","白豹","薛岔","铁边","长官","长城"],
                axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
		            lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	         	 axisLabel: {
              		color: '#90a6b7',//坐标值的具体的颜色
              		fontSize:8,
              		interval:0
	          	}
            },
            yAxis: {
            	axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
//	            	show: false
					lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	          	axisLabel: {
	            	textStyle: {
	              		color: '#90a6b7',//坐标值的具体的颜色
	            	},
	            	formatter: '{value} %'
	          	},
	          	splitLine: {
	            	lineStyle: {
	              		color: ['transparent'],//分割线的颜色
	            	}
	          	}
            },
            series: [{          
                type: 'bar',
                data: [22.62, 10.29, 9.63, 17.57, 11.90, 10.28, 9.19, 9.59],
                barWidth: 10, //设置柱子宽度，单位为px
		        itemStyle: {
		            normal: {
		              color: '#00FFFF',//设置柱子颜色
		            },
		            label: {
                        show: true,
                        position: 'top',
                        formatter: '{b}\n{c}%'
                   }
		        },
		        markPoint: {
	                tooltip: {
	                    trigger: 'item',
	                    backgroundColor: 'rgba(0,0,0,0)',
	                    formatter: function(params){
	                        return '<img src="' 
	                                + params.data.symbol.replace('image://', '')
	                                + '"/>';
	                    }
	                }
	      		}
            }]
        };
		var optionWeek2 = {
			tooltip: {
		        trigger: 'item',
		        formatter: '{b}:\n{c}%'
		   },
		    grid: {
		        left: 45
		    },
            xAxis: {
            	data: ["五谷城","吴仓堡","周湾","城镇","庙沟","新寨","王洼子","白豹","薛岔","铁边","长官","长城"],
                axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
		            lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	         	 axisLabel: {
              		color: '#90a6b7',//坐标值的具体的颜色
              		fontSize:8,
              		interval:0
	          	}
            },
            yAxis: {
            	axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
//	            	show: false
					lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	          	axisLabel: {
	            	textStyle: {
	              		color: '#90a6b7',//坐标值的具体的颜色
	            	},
	            	formatter: '{value} %'
	          	},
	          	splitLine: {
	            	lineStyle: {
	              		color: ['transparent'],//分割线的颜色
	            	}
	          	}
            },
            series: [{          
                type: 'bar',
                data: [19.29, 13.26, 8.79, 15.18, 13.84, 13.47, 10.36, 11.01],
                barWidth: 10, //设置柱子宽度，单位为px
		        itemStyle: {
		            normal: {
		              color: '#00FFFF',//设置柱子颜色
		            },
		            label: {
                        show: true,
                        position: 'top',
                        formatter: '{b}\n{c}%'
                   }
		        },
		        markPoint: {
	                tooltip: {
	                    trigger: 'item',
	                    backgroundColor: 'rgba(0,0,0,0)',
	                    formatter: function(params){
	                        return '<img src="' 
	                                + params.data.symbol.replace('image://', '')
	                                + '"/>';
	                    }
	                }
	      		}
            }]
        };
		var optionMonth2 = {
			tooltip: {
		        trigger: 'item',
		        formatter: '{b}:\n{c}%'
		   },
		    grid: {
		        left: 45
		    },
            xAxis: {
            	data: ["五谷城","吴仓堡","周湾","城镇","庙沟","新寨","王洼子","白豹","薛岔","铁边","长官","长城"],
                axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
		            lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	         	 axisLabel: {
              		color: '#90a6b7',//坐标值的具体的颜色
              		fontSize:8,
              		interval:0
	          	}
            },
            yAxis: {
            	axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
//	            	show: false
					lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	          	axisLabel: {
	            	textStyle: {
	              		color: '#90a6b7',//坐标值的具体的颜色
	            	},
	            	formatter: '{value} %'
	          	},
	          	splitLine: {
	            	lineStyle: {
	              		color: ['transparent'],//分割线的颜色
	            	}
	          	}
            },
            series: [{          
                type: 'bar',
                data: [24.89, 1.76,10.64, 13.97, 10.97, 12.17, 12.06, 13.53],
                barWidth: 10, //设置柱子宽度，单位为px
		        itemStyle: {
		            normal: {
		              color: '#00FFFF',//设置柱子颜色
		            },
		            label: {
                        show: true,
                        position: 'top',
                        formatter: '{b}\n{c}%'
                   }
		        },
		        markPoint: {
	                tooltip: {
	                    trigger: 'item',
	                    backgroundColor: 'rgba(0,0,0,0)',
	                    formatter: function(params){
	                        return '<img src="' 
	                                + params.data.symbol.replace('image://', '')
	                                + '"/>';
	                    }
	                }
	      		}
            }]
        };
		var optionYear2 = {
			tooltip: {
		        trigger: 'item',
		        formatter: '{b}:\n{c}%'
		   },
		    grid: {
		        left: 45
		    },
            xAxis: {
            	data: ["五谷城","吴仓堡","周湾","城镇","庙沟","新寨","王洼子","白豹","薛岔","铁边","长官","长城"],
                axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
		            lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	         	 axisLabel: {
              		color: '#90a6b7',//坐标值的具体的颜色
              		fontSize:8,
              		interval:0
	          	}
            },
            yAxis: {
            	axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
//	            	show: false
					lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	          	axisLabel: {
	            	textStyle: {
	              		color: '#90a6b7',//坐标值的具体的颜色
	            	},
	            	formatter: '{value} %'
	          	},
	          	splitLine: {
	            	lineStyle: {
	              		color: ['transparent'],//分割线的颜色
	            	}
	          	}
            },
            series: [{          
                type: 'bar',
                data: [21.58, 15.72, 12.38, 16.97, 12.17, 10.27, 10.26, 12.31],
                barWidth: 10, //设置柱子宽度，单位为px
		        itemStyle: {
		            normal: {
		              color: '#00FFFF',//设置柱子颜色
		            },
		            label: {
                        show: true,
                        position: 'top',
                        formatter: '{b}\n{c}%'
                   }
		        },
		        markPoint: {
	                tooltip: {
	                    trigger: 'item',
	                    backgroundColor: 'rgba(0,0,0,0)',
	                    formatter: function(params){
	                        return '<img src="'+ params.data.symbol.replace('image://', '')+ '"/>';
	                    }
	                }
	      		}
            }]
        };
        var optionDate2 = {
			tooltip: {
		        trigger: 'item',
		        formatter: '{b}:\n{c}%'
		   },
		    grid: {
		        left: 45
		    },
            xAxis: {
            	data: ["五谷城","吴仓堡","周湾","城镇","庙沟","新寨","王洼子","白豹","薛岔","铁边","长官","长城"],
                axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
		            lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	         	 axisLabel: {
              		color: '#90a6b7',//坐标值的具体的颜色
              		fontSize:8,
              		interval:0
	          	}
            },
            yAxis: {
            	axisTick: {//刻度
	            	show: false//不显示刻度线
	          	},
	          	axisLine: {//坐标线
//	            	show: false
					lineStyle: {
		              type: 'solid',
		              color: '#1C305E',//轴线的颜色
		            }
	          	},
	          	axisLabel: {
	            	textStyle: {
	              		color: '#90a6b7',//坐标值的具体的颜色
	            	},
	            	formatter: '{value} %'
	          	},
	          	splitLine: {
	            	lineStyle: {
	              		color: ['transparent'],//分割线的颜色
	            	}
	          	}
            },
            series: [{          
                type: 'bar',
                data: [15.58, 10.72, 8.38, 5.97, 16.17, 2.27, 10.26, 12.31],
                barWidth: 10, //设置柱子宽度，单位为px
		        itemStyle: {
		            normal: {
		              color: '#00FFFF',//设置柱子颜色
		            },
		            label: {
                        show: true,
                        position: 'top',
                        formatter: '{b}\n{c}%'
                   }
		        },
		        markPoint: {
	                tooltip: {
	                    trigger: 'item',
	                    backgroundColor: 'rgba(0,0,0,0)',
	                    formatter: function(params){
	                        return '<img src="'+ params.data.symbol.replace('image://', '')+ '"/>';
	                    }
	                }
	      		}
            }]
        };
		var optionDay3 = {
			 title: {
                text: '区域内刑事案件统计',
                top:'8%',
                left:"5%",
                textStyle: {    
	                color: "#ffffff",
	                fontSize: 12,   
	                fontWeight:"normal"
                }
            },
            tooltip: {
                 trigger: "axis",  
            },
	        legend: {
	        	itemWidth:8,  
                itemHeight:8, 
                top:'8%',
                left:"20%",
	            data:['发案数','破案数'],
	            textStyle:{//图例文字的样式
		            color:'#ffffff',
		            fontSize:10,
		            fontWeight:"normal"
		        }
	        },
            xAxis: {
            	data: ["五谷城","吴仓堡","周湾","城镇","庙沟","新寨","王洼子","白豹","薛岔","铁边","长官","长城"],
                axisTick: { show: false},
	          	axisLine: {
		            lineStyle: {type: 'solid',color: '#1C305E',}
	          	},
	         	 axisLabel: {
              		color: '#90a6b7',fontSize:8,interval:0
	          	}
            },
            yAxis: {
            	axisTick: {show: false},
	          	axisLine: {
					lineStyle: {type: 'solid',color: '#1C305E',}
	          	},
	          	axisLabel: {
	            	textStyle: {color: '#90a6b7',}
	          	},
	          	splitLine: {
	            	lineStyle: {color: ['transparent'],}
	          	}
            },
            series: [
            {
	            type: 'line',
	            name:'发案数',
//	            stack:'案件数量',
		        itemStyle: {
		            normal: {
		              color: '#00FFFF',	
		            }
		        },
		        data: []
	        },
	        {
	            type: 'line',
	            name:'破案数',
//	            stack:'案件数量',
		        itemStyle: {
		            normal: {
		              color: '#ffa602'            
		            }
		        },
		        data: []
	        },
            ]
       };
//     myChart3.showLoading();    //数据加载完之前先显示一段简单的loading动画
		
		function getEchartVideoCount(type, currentDate, weekEndDate){
	     	$.ajax({
		        type: "post",
		        url: requestPslesBasePath + "lawenAudioVideo/getVideoRelateEchart",
		        data: {
		        	type:type,
		        	startDate:currentDate,
		        	endDate:weekEndDate
		        },
		        cache: false,
		        dataType: "json",
		        success: function (data,textStatus,jqXHR){
		        	if (null != data && data != "") {
		        		videoOption.series[0].data = data.rel;
		        		videoOption.series[1].data = data.unrel;
		        		myChart1.setOption(videoOption);
		        	}
		        },
		        error:function (data,textStatus) {      
		             alert("音视频关联图请求后台数据失败！");
		        },
		        beforeSend: function(){      
		        },     
		        complete: function(){      
		        }  
	     	});  
		}
  
       function getAllCase(type,currentDate, weekEndDate){
       	    var dependCase = [];    //销用来盛放Y坐标值        
      		var dealCase = [];
   		    $.ajax({
		        type: "post",
		        url: requestPslesBasePath + "lawenforce/getPoliceCaseAndSolvedCount",
		        data: {
			        	type:type,
			        	startDate:currentDate,
			        	endDate:weekEndDate
		        },
		        cache: false,
		        dataType: "json",
		        success: function (data,textStatus,jqXHR){
		        	if (data) {
	                    for(var i=0;i<data.length;i++){       
	                       dependCase.push(data[i].caseCount);    
	                    }
	                    for(var i=0;i<data.length;i++){       
	                        dealCase.push(data[i].solvedCount);    
	                    }
	                    myChart3.hideLoading();    //隐藏加载动画
	                    myChart3.setOption({        //加载数据图表
	                        series: [
	                       	 	{
		                            name: '发案数',
		                            data: dependCase
	                        	},
	                        	{
		                            name: '破案数',
		                            data: dealCase
	                       	 	}
	                        ]
	                    });
	                    
	             }					
		        },
		        error:function (data,textStatus) {      
		             console.log(data)
		        }
     		}); 
       }
 
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(optionDay);
        myChart2.setOption(videoOption);
        myChart2.setOption(optionDay2);
        myChart3.setOption(optionDay3);
        
        function sameDay(){
        	currentColor(1)
			myChart.clear()
	        myChart.setOption(optionDay);
        }
        function sameWeek(){
        	currentColor(2)
        	myChart.clear()
	        myChart.setOption(optionWeek);
        }
        function sameMonth(){
        	currentColor(3)
        	myChart.clear()
	        myChart.setOption(optionMonth);
        }
        function sameYear(){
        	currentColor(4)
        	myChart.clear()
	        myChart.setOption(optionYear);
        }
        function sameDate(){
        	currentColor(5)
        	myChart.clear()
	        myChart.setOption(optionDate);
        }
        
        function sameDay1(){
        	currentVideo("video11")
			myChart1.clear()
	        myChart1.setOption(optionDay1);
        }
        function sameWeek1(){
        	currentVideo("video12")
        	myChart1.clear()
	        myChart1.setOption(optionWeek1);
        }
        function sameMonth1(){
        	currentVideo("video13")
        	myChart1.clear()
	        myChart1.setOption(optionMonth1);
        }
        function sameYear1(){
        	currentVideo("video14")
        	myChart1.clear()
	        myChart1.setOption(optionYear1);
        }
        function sameDate1(){
        	currentVideo("video15")
        	myChart1.clear()
	        myChart1.setOption(optionDate1);
        }
        function sameDay2(){
        	prediction("future1")
			myChart2.clear()
	        myChart2.setOption(optionDay2);
        }
        function sameWeek2(){
        	prediction("future2")
        	myChart2.clear()
	        myChart2.setOption(optionWeek2);
        }
        function sameMonth2(){
        	prediction("future3")
        	myChart2.clear()
	        myChart2.setOption(optionMonth2);
        }
        function sameYear2(){
        	prediction("future4")
        	myChart2.clear()
	        myChart2.setOption(optionYear2);
        }      
        function sameDate2(){
        	prediction("future5")
        	myChart2.clear()
	        myChart2.setOption(optionDate2);
        } 
    
 function criclefn(num){
	var degree=num*3.6;
    if(degree>360) degree=360;
    if(degree<0) degree=0;     
	$({property:0}).animate({property:100},
	    {
	        duration:600,
	        step:function(){
	            var deg=this.property/100*degree;
	            var percent=parseInt(this.property/100*num)+1;
	            if (deg<=180) {
	                $(".right").css("-webkit-transform","rotate("+deg+"deg)");
	                $(".mask").text(percent);
	                $(".mask").css("color","#02f4f6");
	            }else{
	                $(".mask").css("color","#02f4f6");	                
	                deg=deg-180;
	                $(".right").css("-webkit-transform","rotate("+180+"deg)");
	                $(".mask").text(percent);
//	                $(".left").css("-webkit-transform","rotate("+deg+"deg)");
	            }              
	    }
	 });
 }
 function criclefn1(num){
	var degree=num*1;
    if(degree>360) degree=360;
    if(degree<0) degree=0;     
	$({property:0}).animate({property:100},
	    {
	        duration:600,
	        step:function(){
	            var deg=this.property/100*degree;
	            var percent=parseInt(this.property/100*num)+1;
	            if (deg<=180) {
	                $(".right1").css("-webkit-transform","rotate("+deg+"deg)");
	                $(".mask1").text(percent);
	                $(".mask1").css("color","#fbd741");
	            }else{
	                $(".mask1").css("color","#fbd741");
	                deg=deg-180;
	                $(".right1").css("-webkit-transform","rotate("+180+"deg)");
	                $(".mask1").text(percent);
	            }              
	    }
	 });
 }
 function criclefn2(num){
	var degree=num*1;
    if(degree>360) degree=360;
    if(degree<0) degree=0;     
	$({property:0}).animate({property:100},
	    {
	        duration:600,
	        step:function(){
	            var deg=this.property/100*degree;
	            var percent=parseInt(this.property/100*num)+1;
	            if (deg<=180) {
	                $(".right2").css("-webkit-transform","rotate("+deg+"deg)");
	                $(".mask2").text(percent);
	                $(".mask2").css("color","#46a6e3");
	            }else{
	                $(".mask2").css("color","#46a6e3");
	                deg=deg-180;
	                $(".right2").css("-webkit-transform","rotate("+180+"deg)");
	                $(".mask2").text(percent);
	            }              
	    }
	 });
 }
progressbar("finacial1");
function currentColor(x){
	$("#1").css("color","#90a6b7")
	$("#2").css("color","#90a6b7")	
    $("#3").css("color","#90a6b7")	
    $("#4").css("color","#90a6b7")	
    $("#5").css("color","#90a6b7")
	if(x == "1"){
		$("#1").css("color","#FFFFFF")
	}else if(x == "2"){
		$("#2").css("color","#FFFFFF")
	}else if(x == "3"){
		$("#3").css("color","#FFFFFF")
	}else if(x == "4"){
		$("#4").css("color","#FFFFFF")
	}else if(x == "5"){
		$("#5").css("color","#FFFFFF")
	}
}
function currentColor1(y){	
	$("#sameDay3").css("color","#90a6b7")
    $("#sameDate3").css("color","#90a6b7")
	$("#sameWeek3").css("color","#90a6b7")	
    $("#sameMonth3").css("color","#90a6b7")	
    $("#sameYear3").css("color","#90a6b7")	
	if(y == "sameDay3"){
		$("#sameDay3").css("color","#FFFFFF")
	}else if(y == "sameWeek3"){
		$("#sameWeek3").css("color","#FFFFFF")
	}else if(y == "sameMonth3"){
		$("#sameMonth3").css("color","#FFFFFF")
	}else if(y == "sameYear3"){
		$("#sameYear3").css("color","#FFFFFF")
	}else if(y == "sameDate3"){
		$("#sameDate3").css("color","#FFFFFF")
	}
}
function currentVideo(videoid){
	$("#video11").css("color","#90a6b7")
	$("#video12").css("color","#90a6b7")	
    $("#video13").css("color","#90a6b7")	
    $("#video14").css("color","#90a6b7")	
    $("#video15").css("color","#90a6b7")	
	if(videoid == "video11"){	
		$("#video11").css("color","#FFFFFF")
	}else if(videoid == "video12"){
		$("#video12").css("color","#FFFFFF")
	}else if(videoid == "video13"){
		$("#video13").css("color","#FFFFFF")
	}else if(videoid == "video14"){
		$("#video14").css("color","#FFFFFF")
	}else if(videoid == "video15"){
		$("#video15").css("color","#FFFFFF")
	}
}
function prediction(pred){	
    $("#future1").css("color","#90a6b7")
	$("#future2").css("color","#90a6b7")	
    $("#future3").css("color","#90a6b7")	
    $("#future4").css("color","#90a6b7")	
    $("#future5").css("color","#90a6b7")	
	if(pred == "future1"){
		$(".sameDay2").css("color","#FFFFFF")
	}else if(pred == "future2"){
		$(".sameWeek2").css("color","#FFFFFF")
	}else if(pred == "future3"){
		$(".sameMonth2").css("color","#FFFFFF")
	}else if(pred == "future4"){
		$(".sameYear2").css("color","#FFFFFF")
	}else if(pred == "future5"){
		$(".sameDate2").css("color","#FFFFFF")
	}	
}
criclefn(34);
criclefn1(18);
criclefn2(16);
function progressbar(x){
	if(x == "finacial1"){
		$("#finacial1").css("color","#FFFFFF")
		$("#finacial2").css("color","#90a6b7")	
	    $("#finacial3").css("color","#90a6b7")	
	    $("#finacial4").css("color","#90a6b7")
	    $("#finacial5").css("color","#90a6b7")
		criclefn(34);
	    criclefn1(18);
	    criclefn2(16);
	}else if(x == "finacial2"){
		$("#finacial2").css("color","#FFFFFF")
		$("#finacial1").css("color","#90a6b7")	
	    $("#finacial3").css("color","#90a6b7")	
	    $("#finacial4").css("color","#90a6b7")
	    $("#finacial5").css("color","#90a6b7")
		criclefn(88);
	    criclefn1(36);
	    criclefn2(52);
	}else if(x == "finacial3"){
		$("#finacial3").css("color","#FFFFFF")
		$("#finacial2").css("color","#90a6b7")	
	    $("#finacial1").css("color","#90a6b7")	
	    $("#finacial4").css("color","#90a6b7")
	    $("#finacial5").css("color","#90a6b7")
		criclefn(235);
	    criclefn1(154);
	    criclefn2(81);
	}else if(x == "finacial4"){
		$("#finacial4").css("color","#FFFFFF")
		$("#finacial2").css("color","#90a6b7")	
	    $("#finacial3").css("color","#90a6b7")	
	    $("#finacial1").css("color","#90a6b7")
	    $("#finacial5").css("color","#90a6b7")
		criclefn(352);
	    criclefn1(151);
	    criclefn2(201);
	}	
	else if(x == "finacial5"){
		$("#finacial5").css("color","#FFFFFF")
		$("#finacial2").css("color","#90a6b7")	
	    $("#finacial3").css("color","#90a6b7")	
	    $("#finacial1").css("color","#90a6b7")
	    $("#finacial4").css("color","#90a6b7")
		criclefn(352);
	    criclefn1(151);
	    criclefn2(201);
	}	
}
//var serx = [];
//var sery = [];
//var objx = new Object();
//objx.name = "派出所";
//for(var i = 0;i < data.length;i++) {
//	serx.push(data[i].caseCount);
//	sery.push(data[i].solvedCount);
//}
//objx.data = serx;

 