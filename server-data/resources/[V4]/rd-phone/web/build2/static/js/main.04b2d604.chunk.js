;(this.webpackJsonpweb = this.webpackJsonpweb || []).push([
	[0],
	{
	  159: function (S, M, p) {},
	  174: function (B0, B1, B2) {
		'use strict'
		B2.r(B1)
		var B4 = B2(1),
		  B5 = B2.n(B4),
		  B6 = B2(54),
		  B7 = B2.n(B6),
		  B8 = (B2(159), B2(15)),
		  B9 = B2(3),
		  BB = (B2(19), function () {}),
		  Bi = function (Sw, Sc) {
			var Sk = Object(B4.useRef)(BB)
			Object(B4.useEffect)(
			  function () {
				Sk.current = Sc
			  },
			  [Sc]
			)
			Object(B4.useEffect)(
			  function () {
				var SP = function (SZ) {
				  var SV = SZ.data,
					Sm = SV.action,
					SY = SV.data
				  Sk.current && Sm === Sw && Sk.current(SY)
				}
				return (
				  window.addEventListener('message', SP),
				  function () {
					return window.removeEventListener('message', SP)
				  }
				)
			  },
			  [Sw]
			)
		  },
		  BS = B2(93),
		  BM = B2(50),
		  Bp = B2.n(BM)
		function Ba(Sw, Sc) {
		  return Bs.apply(this, arguments)
		}
		function Bs() {
		  return (Bs = Object(BS.a)(
			Bp.a.mark(function Sc(Sx, Sk) {
			  var Sv, SP, SZ, SV
			  return Bp.a.wrap(function (Sm) {
				for (;;) {
				  switch ((Sm.prev = Sm.next)) {
					case 0:
					  return (
						(Sv = {
						  method: 'post',
						  headers: {
							'Content-Type': 'application/json; charset=UTF-8',
						  },
						  body: JSON.stringify(Sk),
						}),
						(SP = window.GetParentResourceName
						  ? window.GetParentResourceName()
						  : 'nui-frame-app'),
						(Sm.next = 4),
						fetch('https://'.concat(SP, '/').concat(Sx), Sv)
					  )
					case 4:
					  return (SZ = Sm.sent), (Sm.next = 7), SZ.json()
					case 7:
					  return (SV = Sm.sent), Sm.abrupt('return', SV)
					case 9:
					case 'end':
					  return Sm.stop()
				  }
				}
			  }, Sc)
			})
		  )).apply(this, arguments)
		}
		var Bo = ['Escape'],
		  BQ = B2(27),
		  BO = B2(85),
		  Bn = B2(134),
		  BK = B2(267),
		  Bb = B2(249),
		  Bg = B2(248),
		  BT = function () {
			{
			  var Sw = Object(B4.useState)([]),
				Sc = Object(B9.a)(Sw, 2),
				Sx = Sc[0],
				Sk = Sc[1]
			  return {
				notifications: Sx,
				addNotification: function (Sv) {
				  return Sk(function (SZ) {
					return [].concat(Object(B8.a)(SZ), [Sv])
				  })
				},
				deleteNotification: function (Sv) {
				  return Sk(function (SV) {
					return SV.filter(function (Sm) {
					  return Sm.id !== Sv
					})
				  })
				},
			  }
			}
		  },
		  BN = B2(123),
		  BG = B2(0),
		  By = function (Sw) {
			var Sx = parseInt(Sw, 10)
			return [Math.floor(Sx / 3600), Math.floor(Sx / 60) % 60, Sx % 60]
			  .map(function (Sk) {
				return Sk < 10 ? '0' + Sk : Sk
			  })
			  .filter(function (Sk, Sv) {
				return '00' !== Sk || Sv > 0
			  })
			  .join(':')
		  }
		function Bu(Sw) {
		  var Sc = Sw.seconds,
			Sx = Sw.text,
			Sk = (function (SP, SZ, SV) {
			  var SY = Object(B4.useState)(SP),
				Sz = Object(B9.a)(SY, 2),
				SF = Sz[0],
				SX = Sz[1]
			  return (
				Object(B4.useEffect)(
				  function () {
					0 !== SF
					  ? setTimeout(function () {
						  SX(SF - 1)
						}, 1000)
					  : Ba(SV, {
						  action: 'reject',
						  _data: { confirmationId: SZ },
						})
				  },
				  [SF]
				),
				SF
			  )
			})(Sc, Sw.id, Sw.callback),
			Sv = By(Sk)
		  return Object(BG.jsxs)('div', {
			children: [Sv, ' - ', Sx],
		  })
		}
		function Bf(Sw) {
		  {
			Object(BN.a)(Sw)
			var Sx = (function () {
				var SZ = Object(B4.useState)(0),
				  SV = Object(B9.a)(SZ, 2),
				  Sm = SV[0],
				  SY = SV[1]
				return (
				  Object(B4.useEffect)(
					function () {
					  setTimeout(function () {
						SY(Sm + 1)
					  }, 1000)
					},
					[Sm]
				  ),
				  Sm
				)
			  })(),
			  Sk = By(Sx)
			return Object(BG.jsx)('div', { children: Sk })
		  }
		}
		var Bh = function (Sw) {
			{
			  var Sx = Sw.deleteNotification,
				Sk = Sw.notification,
				Sv = Sk.id,
				SP = Sk.isCall,
				SZ = Sk.calls,
				SV = Sk.isConfirmation,
				Sm = Sk.confirmation,
				SY = Sk.header,
				Sz = Sk.content,
				SF = Sk.isPerma,
				SX = Sk.cancelButton,
				SD = Sk.jobGroupId,
				Sr = Sk.icon,
				Sl = Sk.iconColor,
				Sd = Sk.bgColor,
				Sj = Object(B4.useState)(true),
				SH = Object(B9.a)(Sj, 2),
				SI = SH[0],
				SR = SH[1],
				SA = Object(B4.useState)(false),
				SL = Object(B9.a)(SA, 2),
				SJ = SL[0],
				SC = SL[1],
				SE = Object(B4.useState)(false),
				SU = Object(B9.a)(SE, 2),
				SW = SU[0],
				M0 = SU[1],
				M1 = Object(B4.useState)(false),
				M2 = Object(B9.a)(M1, 2),
				M3 = M2[0],
				M4 = M2[1],
				M5 = Object(B4.useState)(''),
				M6 = Object(B9.a)(M5, 2),
				M7 = M6[0],
				M8 = M6[1],
				M9 = Object(B4.useState)(''),
				MB = Object(B9.a)(M9, 2),
				Mi = MB[0],
				MS = MB[1],
				MM = Object(B4.useState)(''),
				Mp = Object(B9.a)(MM, 2),
				Ma = Mp[0],
				Ms = Mp[1]
			  Object(B4.useEffect)(function () {
				SW || (M0(true), M8(SY), MS(Sz), Ms(SD))
			  }, [])
			  Object(B4.useEffect)(function () {
				{
				  if (!SF) {
					var Mn = setTimeout(
					  function () {
						return SR(false)
					  },
					  SV ? Number(1000 * Sm.timeOut) : 3000
					)
					return function () {
					  clearTimeout(Mn)
					}
				  }
				}
			  }, [])
			  Object(B4.useEffect)(
				function () {
				  SI ||
					(SC(true),
					setTimeout(function () {
					  Sx(Sv)
					}, 500))
				},
				[SI, Sx, Sv]
			  )
			  Bi('updateNotify', function (MO) {
				Number(MO.id) === Number(Ma) &&
				  ((undefined === MO.title && '' === MO.title) || M8(MO.title),
				  (undefined === MO.body && '' === MO.body) || MS(MO.body))
			  })
			  Bi('closeNotify', function (MO) {
				Number(MO.id) === Number(Ma) &&
				  (SR(false),
				  SI ||
					(SC(true),
					setTimeout(function () {
					  Sx(Sv)
					}, 500)))

					
					if (item.openSection === "GasOffer") {
						createGasBill(item.GasBillInfo)
					}

					$(document).ready(function () {
						$(document).on('click', '.decline-gasBill', function () {
							clearInterval(GasInterval);
							btnGasDecline()
						});
					
						$(document).on('click', '.accept-gasBill', function () {
							clearInterval(GasInterval);
							$('.action-button').hide()
							$('.text').html('<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary">Purchasing...</p>')
							setTimeout(() => {
								$('.text').html('<p class="MuiTypography-root MuiTypography-body1 MuiTypography-colorTextPrimary">Payment Successful!</p>')
								setTimeout(() => {
									btnGasAccept()
								}, 100);
							}, 2000);
						})
					})
					
					btnGasAccept = () => {
						setTimeout(() => {
							var deleteCallNot = document.getElementsByClassName("notification-container")
							for (i = 0; i < 1; i++) {
								deleteCallNot[0].style.animation = "cometopaparevers 0.5s";
								setTimeout(function () {
									for (i = 0; i < deleteCallNot.length; i++) {
										deleteCallNot[0].innerHTML = "";
										deleteCallNot[0].remove();
										if (pPhoneOpen === false) {
											movePhone('close')
										}
									}
								}, 499)
							}
						}, 3000)
						$.post("https://rd-phone/gasOfferAccepted", JSON.stringify({
						}))
					}
			  })
			  Bi('closeNotifyByCallID', function (MO) {
				Number(MO.callId) === SZ.callId && (SR(false), SI || Sx(Sv))
			  })
			  Bi('updateNotifyByCallID', function (MO) {
				Number(MO.callId) === SZ.callId &&
				  (M4(true),
				  MS('Disconnected!'),
				  setTimeout(function () {
					SC(true)
					setTimeout(function () {
					  M4(false)
					  Sx(Sv)
					}, 500)
				  }, 500))
			  })
			  var Mo = function () {
				Ba('rd-ui:callEnd', { callId: SZ.callId }).then(function (Mn) {})
			  }
			  return Object(BG.jsxs)('div', {
				id: Sv,
				className: SJ
				  ? 'notification-container notification-container-fade-out'
				  : 'notification-container ',
				onClick: function () {
				  return (function (Mn) {
					SP ||
					  SV ||
					  SF ||
					  (SC(true),
					  setTimeout(function () {
						Sx(Mn)
					  }, 500))
				  })(Sv)
				},
				children: [
				  Object(BG.jsxs)('div', {
					className: 'app-bar',
					children: [
					  Object(BG.jsx)('div', {
						className: 'icon',
						style: {
						  background: Sd,
						  color: Sl,
						},
						children: Object(BG.jsx)('i', {
						  className: ''.concat(Sr, ' fa-w-16 fa-fw fa-sm'),
						  style: {
							WebkitTextStrokeColor: 'black',
							WebkitTextStrokeWidth: '0.3px',
						  },
						}),
					  }),
					  Object(BG.jsx)('div', {
						className: 'name',
						children: Object(BG.jsx)(BO.a, {
						  style: {
							color: '#fff',
							wordBreak: 'break-word',
						  },
						  variant: 'body2',
						  gutterBottom: true,
						  children: M7,
						}),
					  }),
					  Object(BG.jsx)(BO.a, {
						style: {
						  color: '#fff',
						  wordBreak: 'break-word',
						},
						variant: 'body2',
						gutterBottom: true,
						children: 'just now',
					  }),
					],
				  }),
				  Object(BG.jsxs)('div', {
					className: 'content',
					children: [
					  Object(BG.jsx)('div', {
						className: 'text',
						style: {
						  display: SV || (SP && SZ.progress) ? 'none' : '',
						},
						children: Object(BG.jsx)(BO.a, {
						  style: {
							color: '#fff',
							wordBreak: 'break-word',
						  },
						  variant: 'body2',
						  gutterBottom: true,
						  children: Mi,
						}),
					  }),
					  Object(BG.jsx)('div', {
						className: 'text',
						style: { display: SV ? '' : 'none' },
						children: Object(BG.jsx)(BO.a, {
						  style: {
							color: '#fff',
							wordBreak: 'break-word',
						  },
						  variant: 'body2',
						  gutterBottom: true,
						  children: Object(BG.jsx)(Bu, {
							seconds: Number(Sm.timeOut),
							text: Mi,
							id: Sm.id,
							callback: Sm.onAccept,
						  }),
						}),
					  }),
					  Object(BG.jsx)('div', {
						className: 'text',
						style: { display: SP && SZ.progress ? '' : 'none' },
						children: Object(BG.jsx)(BO.a, {
						  style: {
							color: '#fff',
							wordBreak: 'break-word',
						  },
						  variant: 'body2',
						  gutterBottom: true,
						  children: M3 ? Mi : Object(BG.jsx)(Bf, {}),
						}),
					  }),
					  Object(BG.jsxs)('div', {
						className: 'actions',
						children: [
						  Object(BG.jsx)('div', {
							className: 'action action-reject',
							style: {
							  display: SP && SZ.receive && !M3 ? '' : 'none',
							},
							children: Object(BG.jsx)(Bg.a, {
							  title: 'Hang Up',
							  placement: 'top',
							  sx: {
								backgroundColor: 'rgba(97, 97, 97, 0.9)',
								fontSize: '1em',
								maxWdith: '1000px',
							  },
							  arrow: true,
							  children: Object(BG.jsx)('i', {
								onClick: Mo,
								className: 'fas fa-times-circle fa-w-16 fa-fw',
							  }),
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'action action-accept',
							style: {
							  display: SP && SZ.receive && !M3 ? '' : 'none',
							},
							children: Object(BG.jsx)(Bg.a, {
							  title: 'Answer',
							  placement: 'top',
							  sx: {
								backgroundColor: 'rgba(97, 97, 97, 0.9)',
								fontSize: '1em',
								maxWdith: '1000px',
							  },
							  arrow: true,
							  children: Object(BG.jsx)('i', {
								onClick: function () {
								  Ba('rd-ui:callAccept', {
									callId: SZ.callId,
								  }).then(function (Mn) {})
								},
								className: 'fas fa-check-circle fa-w-16 fa-fw',
							  }),
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'action action-reject',
							style: {
							  display: SP && SZ.dialing && !M3 ? '' : 'none',
							},
							children: Object(BG.jsx)(Bg.a, {
							  title: 'Hang Up',
							  placement: 'top',
							  sx: {
								backgroundColor: 'rgba(97, 97, 97, 0.9)',
								fontSize: '1em',
								maxWdith: '1000px',
							  },
							  arrow: true,
							  children: Object(BG.jsx)('i', {
								onClick: Mo,
								className: 'fas fa-times-circle fa-w-16 fa-fw',
							  }),
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'action action-reject',
							style: {
							  display: SP && SZ.progress && !M3 ? '' : 'none',
							},
							children: Object(BG.jsx)(Bg.a, {
							  title: 'Hang Up',
							  placement: 'top',
							  sx: {
								backgroundColor: 'rgba(97, 97, 97, 0.9)',
								fontSize: '1em',
								maxWdith: '1000px',
							  },
							  arrow: true,
							  children: Object(BG.jsx)('i', {
								onClick: Mo,
								className: 'fas fa-times-circle fa-w-16 fa-fw',
							  }),
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'action action-reject',
							style: { display: SV ? '' : 'none' },
							children: Object(BG.jsx)(Bg.a, {
							  title: 'Decline',
							  placement: 'top',
							  sx: {
								backgroundColor: 'rgba(97, 97, 97, 0.9)',
								fontSize: '1em',
								maxWdith: '1000px',
							  },
							  arrow: true,
							  children: Object(BG.jsx)('i', {
								onClick: function () {
								  Ba(Sm.onReject, {
									action: 'reject',
									_data: { confirmationId: Sm.id },
								  })
								  SC(true)
								  setTimeout(function () {
									Sx(Sv)
								  }, 500)
								},
								className: 'fas fa-times-circle fa-w-16 fa-fw',
							  }),
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'action action-accept',
							style: { display: SV ? '' : 'none' },
							children: Object(BG.jsx)(Bg.a, {
							  title: 'Accept',
							  placement: 'top',
							  sx: {
								backgroundColor: 'rgba(97, 97, 97, 0.9)',
								fontSize: '1em',
								maxWdith: '1000px',
							  },
							  arrow: true,
							  children: Object(BG.jsx)('i', {
								onClick: function () {
								  Ba(Sm.onAccept, {
									action: 'accept',
									_data: { confirmationId: Sm.id },
								  })
								  SC(true)
								  setTimeout(function () {
									Sx(Sv)
								  }, 500)
								},
								className: 'fas fa-check-circle fa-w-16 fa-fw',
							  }),
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'action action-reject',
							style: { display: SF && SX ? '' : 'none' },
							children: Object(BG.jsx)(Bg.a, {
							  title: 'Cancel Activity',
							  placement: 'top',
							  sx: {
								backgroundColor: 'rgba(97, 97, 97, 0.9)',
								fontSize: '1em',
								maxWdith: '1000px',
							  },
							  arrow: true,
							  children: Object(BG.jsx)('i', {
								onClick: function () {
								  Ba('cancelActivity', { id: Ma })
								},
								className: 'fas fa-times-circle fa-w-16 fa-fw',
							  }),
							}),
						  }),
						],
					  }),
					],
				  }),
				],
			  })
			}
		  },
		  Bq = B2(20),
		  Bw = B2(256),
		  Bc = B2(246),
		  Bx = B2(259),
		  Bk = B2(251),
		  Bv = B2(17),
		  BP = B2(8),
		  BZ =
			(Object(BP.b)({
			  key: 'hasBurnerState',
			  default: false,
			}),
			Object(BP.b)({
			  key: 'filteredContactsState',
			  default: [],
			}),
			Object(BP.b)({
			  key: 'activeHoverIdState',
			  default: '',
			})),
		  BV = Object(BP.b)({
			key: 'purchaseModalState',
			default: false,
		  }),
		  Bm = Object(BP.b)({
			key: 'exchangeModalState',
			default: false,
		  }),
		  BY = Object(BP.b)({
			key: 'cryptoIdState',
			default: 1,
		  }),
		  Bz = Object(BP.b)({
			key: 'sellModalState',
			default: false,
		  }),
		  BF = Object(BP.b)({
			key: 'sellStateIdState',
			default: 0,
		  }),
		  BX = Object(BP.b)({
			key: 'sellPriceState',
			default: 0,
		  }),
		  BD = Object(BP.b)({
			key: 'sellPlateState',
			default: '',
		  }),
		  Br = Object(BP.b)({
			key: 'hasVPNState',
			default: false,
		  }),
		  Bl = Object(BP.b)({
			key: 'callsDataState',
			default: [],
		  }),
		  Bd = Object(BP.b)({
			key: 'filteredCallsDataState',
			default: [],
		  }),
		  Bj = Object(BP.b)({
			key: 'editModeState',
			default: false,
		  }),
		  BH = Object(BP.b)({
			key: 'editDataState',
			default: {},
		  }),
		  BI = Object(BP.b)({
			key: 'phoneBrandState',
			default: 'android',
		  }),
		  BR = Object(BP.b)({
			key: 'phoneBackgroundState',
			default: 'https://i.imgur.com/3KTfLIV.jpg',
		  }),
		  BA = Object(BP.b)({
			key: 'phoneReceiveSMSState',
			default: true,
		  }),
		  BL = Object(BP.b)({
			key: 'phoneNewTweetState',
			default: true,
		  }),
		  BJ = Object(BP.b)({
			key: 'phoneReceiveEmailState',
			default: true,
		  }),
		  BC = Object(BP.b)({
			key: 'phoneEmbeddedImagesState',
			default: true,
		  }),
		  BE = B2(37),
		  BU = B2.n(BE),
		  BW = B2(233),
		  i0 = B2(254),
		  i1 = B2(245),
		  i2 = B2(234),
		  i3 = B2(255),
		  i4 = B2(240),
		  i5 = Object(i4.a)({
			informationInnerContainer: {
			  position: 'absolute',
			  top: '5%',
			  left: '5%',
			  transition: 'all 400ms ease 0s',
			  willChange: 'left',
			},
			informationSecondInnerContainer: {
			  position: 'absolute',
			  top: '45%',
			  left: '35%',
			},
			informationThirdInnerContainer: {
			  position: 'absolute',
			  top: '51%',
			  left: '0%',
			  overflow: 'auto',
			  maxHeight: '255px',
			},
		  }),
		  i6 = function () {
			var Sc = i5(),
			  Sx = Object(B4.useState)({
				cid: 0,
				bankid: 0,
				phonenumber: 0,
				cash: 0,
				bank: 0,
				casino: 0,
				licenses: [],
			  }),
			  Sk = Object(B9.a)(Sx, 2),
			  Sv = Sk[0],
			  SP = Sk[1]
			return (
			  Object(B4.useEffect)(function () {
				Ba('getInfoData', {}).then(function (Sm) {
				  SP(Sm)
				})
			  }, []),
			  Object(BG.jsx)(BG.Fragment, {
				children: Object(BG.jsxs)('div', {
				  className: 'information-container',
				  style: { zIndex: 500 },
				  children: [
					Object(BG.jsxs)('div', {
					  className: Sc.informationInnerContainer,
					  children: [
						Object(BG.jsx)(Bg.a, {
						  title: 'State ID',
						  placement: 'top',
						  sx: {
							backgroundColor: 'rgba(97, 97, 97, 0.9)',
							fontSize: '1em',
							maxWdith: '1000px',
						  },
						  arrow: true,
						  children: Object(BG.jsxs)(BW.a, {
							sx: { marginBottom: '5%' },
							direction: 'row',
							alignItems: 'center',
							gap: 1,
							children: [
							  Object(BG.jsx)('i', {
								className: 'fas fa-id-card fa-w-16 fa-fw',
								style: {
								  color: '#fff',
								  fontSize: '25px',
								},
							  }),
							  Object(BG.jsx)(BO.a, {
								variant: 'subtitle1',
								sx: {
								  fontSize: '1.2rem',
								  fontWeight: '500',
								},
								style: { color: '#fff' },
								children: Sv.cid,
							  }),
							],
						  }),
						}),
						Object(BG.jsx)(Bg.a, {
						  title: 'Bank ID',
						  placement: 'top',
						  sx: {
							backgroundColor: 'rgba(97, 97, 97, 0.9)',
							fontSize: '1em',
							maxWdith: '1000px',
						  },
						  arrow: true,
						  children: Object(BG.jsxs)(BW.a, {
							sx: { marginBottom: '5%' },
							direction: 'row',
							alignItems: 'center',
							gap: 1,
							children: [
							  Object(BG.jsx)('i', {
								className: 'fas fa-university fa-w-16 fa-fw',
								style: {
								  color: '#fff',
								  fontSize: '25px',
								},
							  }),
							  Object(BG.jsx)(BO.a, {
								variant: 'subtitle1',
								sx: {
								  fontSize: '1.2rem',
								  fontWeight: '500',
								},
								style: { color: '#fff' },
								children: Sv.bankid,
							  }),
							],
						  }),
						}),
						Object(BG.jsx)(Bg.a, {
						  title: 'Phone Number',
						  placement: 'top',
						  sx: {
							backgroundColor: 'rgba(97, 97, 97, 0.9)',
							fontSize: '1em',
							maxWdith: '1000px',
						  },
						  arrow: true,
						  children: Object(BG.jsxs)(BW.a, {
							sx: { marginBottom: '5%' },
							direction: 'row',
							alignItems: 'center',
							gap: 1,
							children: [
							  Object(BG.jsx)('i', {
								className: 'fas fa-mobile fa-w-16 fa-fw',
								style: {
								  color: '#fff',
								  fontSize: '25px',
								},
							  }),
							  Object(BG.jsx)(BO.a, {
								variant: 'subtitle1',
								sx: {
								  fontSize: '1.2rem',
								  fontWeight: '500',
								},
								style: { color: '#fff' },
								children: (function (SZ) {
								  {
									var Sm = ('' + SZ)
									  .replace(/\D/g, '')
									  .match(/^(\d{3})(\d{3})(\d{4})$/)
									return Sm
									  ? '(' + Sm[1] + ') ' + Sm[2] + '-' + Sm[3]
									  : SZ
								  }
								})(Sv.phonenumber),
							  }),
							],
						  }),
						}),
						Object(BG.jsx)(Bg.a, {
						  title: 'Cash on you',
						  placement: 'top',
						  sx: {
							backgroundColor: 'rgba(97, 97, 97, 0.9)',
							fontSize: '1em',
							maxWdith: '1000px',
						  },
						  arrow: true,
						  children: Object(BG.jsxs)(BW.a, {
							sx: { marginBottom: '5%' },
							direction: 'row',
							alignItems: 'center',
							gap: 1,
							children: [
							  Object(BG.jsx)('i', {
								className: 'fas fa-wallet fa-w-16 fa-fw',
								style: {
								  color: '#aed581',
								  fontSize: '25px',
								},
							  }),
							  Object(BG.jsx)(BO.a, {
								variant: 'subtitle1',
								sx: {
								  fontSize: '1.2rem',
								  fontWeight: '500',
								},
								style: { color: '#fff' },
								children: Sv.cash.toLocaleString('en-Us', {
								  style: 'currency',
								  currency: 'USD',
								}),
							  }),
							],
						  }),
						}),
						Object(BG.jsx)(Bg.a, {
						  title: 'Money in your bank',
						  placement: 'top',
						  sx: {
							backgroundColor: 'rgba(97, 97, 97, 0.9)',
							fontSize: '1em',
							maxWdith: '1000px',
						  },
						  arrow: true,
						  children: Object(BG.jsxs)(BW.a, {
							sx: { marginBottom: '5%' },
							direction: 'row',
							alignItems: 'center',
							gap: 1,
							children: [
							  Object(BG.jsx)('i', {
								className: 'fas fa-piggy-bank fa-w-16 fa-fw',
								style: {
								  color: '#4dd0e1',
								  fontSize: '25px',
								},
							  }),
							  Object(BG.jsx)(BO.a, {
								variant: 'subtitle1',
								sx: {
								  fontSize: '1.2rem',
								  fontWeight: '500',
								},
								style: { color: '#fff' },
								children: Sv.bank.toLocaleString('en-Us', {
								  style: 'currency',
								  currency: 'USD',
								}),
							  }),
							],
						  }),
						}),
						Object(BG.jsx)(Bg.a, {
						  title: 'Casino Balance',
						  placement: 'top',
						  sx: {
							backgroundColor: 'rgba(97, 97, 97, 0.9)',
							fontSize: '1em',
							maxWdith: '1000px',
						  },
						  arrow: true,
						  children: Object(BG.jsxs)(BW.a, {
							sx: { marginBottom: '5%' },
							direction: 'row',
							alignItems: 'center',
							gap: 1,
							children: [
							  Object(BG.jsx)('i', {
								className: 'fas fa-dice-three fa-w-16 fa-fw',
								style: {
								  color: '#ff4081',
								  fontSize: '25px',
								},
							  }),
							  Object(BG.jsx)(BO.a, {
								variant: 'subtitle1',
								sx: {
								  fontSize: '1.2rem',
								  fontWeight: '500',
								},
								style: { color: '#fff' },
								children: Sv.casino,
							  }),
							],
						  }),
						}),
					  ],
					}),
					Object(BG.jsx)('div', {
					  className: Sc.informationSecondInnerContainer,
					  children: Object(BG.jsx)(BO.a, {
						variant: 'subtitle1',
						sx: { fontSize: '1.4rem' },
						style: { color: '#fff' },
						children: 'Licenses',
					  }),
					}),
					Object(BG.jsx)('div', {
					  className: Sc.informationThirdInnerContainer,
					  children: Object(BG.jsx)(i0.a, {
						disablePadding: true,
						children:
						  Sv.licenses && Sv.licenses.length > 0
							? Sv.licenses.map(function (SZ) {
								return Object(BG.jsx)(i1.a, {
								  sx: {
									paddingTop: '0px',
									paddingBottom: '0px',
								  },
								  secondaryAction: Object(BG.jsx)(i3.a, {
									edge: 'end',
									disabled: true,
									disableFocusRipple: true,
									disableRipple: true,
									disableTouchRipple: true,
									children: Object(BG.jsx)('i', {
									  className: SZ.status
										? 'fas fa-check-circle fa-w-16 fa-fw'
										: 'fas fa-times-circle fa-w-16 fa-fw',
									  style: {
										color: SZ.status ? '#abd17f' : '#d17f7f',
										fontSize: '15px',
									  },
									}),
								  }),
								  children: Object(BG.jsx)(i2.a, {
									primary: Object(BG.jsxs)(BO.a, {
									  variant: 'subtitle1',
									  sx: { fontSize: '1rem' },
									  style: { color: '#fff' },
									  children: [SZ.type, ' License'],
									}),
								  }),
								})
							  })
							: Object(BG.jsx)(BG.Fragment, {}),
					  }),
					}),
				  ],
				}),
			  })
			)
		  },
		  i7 = B2(127),
		  i8 = B2(96),
		  i9 = B2.n(i8),
		  iB = B2(80),
		  ii = B2.n(iB),
		  iS = Object(i4.a)({
			contactModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			contactModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
			contactMessageModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			contactMessageModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
		  }),
		  iM = Object(i4.a)({
			appOuterContainer: {
			  width: '100%',
			  height: '100%',
			  overflow: 'hidden',
			  position: 'absolute',
			  bottom: '0%',
			  opacity: '1',
			},
			appInnerContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  position: 'absolute',
			  transition: 'all 400ms ease 0s',
			  willChange: 'left',
			},
			appSearch: {
			  width: '100%',
			  height: '64px',
			  display: 'flex',
			  padding: '8px 16px',
			  position: 'relative',
			  marginBottom: '8px',
			},
			appSearchWrapper: {
			  width: '100%',
			  position: 'relative',
			},
			appIcon: {
			  top: '32px',
			  right: '16px',
			  display: 'flex',
			  zIndex: '1',
			  position: 'absolute',
			  justifyContent: 'flex-end',
			},
			appIconWrapper: {
			  color: '#fff',
			  marginLeft: '16px',
			},
			appList: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  overflow: 'hidden scroll',
			  maxHeight: 'calc(100% - 72px)',
			  minHeight: 'calc(100% - 72px)',
			},
		  }),
		  ip = B2(36),
		  ia = B2.n(ip),
		  is = function (Sw) {
			var Sx = iM()
			return Object(BG.jsx)(BG.Fragment, {
			  children: Object(BG.jsx)('div', {
				className: Sx.appOuterContainer,
				style: { zIndex: 500 },
				children: Object(BG.jsx)('div', {
				  className: Sx.appInnerContainer,
				  children: Object(BG.jsxs)('div', {
					className: 'app-container',
					children: [
					  Object(BG.jsxs)('div', {
						className: Sx.appSearch,
						style: { display: 0 == Sw.search.length ? 'none' : '' },
						children: [
						  Sw.primaryActions && Sw.primaryActions.length > 0
							? Sw.primaryActions.map(function (Sk) {
								return Object(BG.jsx)(BG.Fragment, {
								  children:
									Sk.type && 'goback' === Sk.type
									  ? Object(BG.jsx)(Bg.a, {
										  title: Sk.title,
										  placement: Sk.placement,
										  sx: {
											backgroundColor:
											  'rgba(97, 97, 97, 0.9)',
										  },
										  arrow: true,
										  children: Object(BG.jsx)('div', {
											style: {
											  color: '#fff',
											  width: '40px',
											  display: 'flex',
											  alignItems: 'center',
											},
											children: Object(BG.jsx)('i', {
											  onClick: Sk.action,
											  className: 'fas '.concat(
												Sk.icon,
												' fa-fw fa-lg'
											  ),
											}),
										  }),
										})
									  : Object(BG.jsx)(BG.Fragment, {}),
								})
							  })
							: Object(BG.jsx)(BG.Fragment, {}),
						  Object(BG.jsx)('div', {
							className: Sx.appSearchWrapper,
							children: Object(BG.jsx)('div', {
							  className: 'input-wrapper',
							  children: Object(BG.jsx)(Bw.a, {
								fullWidth: true,
								sx: { width: '100%' },
								children: Object(BG.jsx)(Bc.a, {
								  id: 'input-with-icon-textfield',
								  label: 'Search',
								  onChange: function (Sk) {
									return (function (SP) {
									  if ('' !== SP) {
										var SV = Sw.search.filter,
										  Sm = Sw.search.list,
										  SY = SP.toString().toLowerCase(),
										  Sz = Sm.filter(function (SF) {
											return Object.keys(SF).some(function (
											  SD
											) {
											  return SV.includes(SD)
											})
										  }).filter(function (SF) {
											return Object.values(SF)
											  .map(function (SD) {
												return null === SD ||
												  undefined === SD
												  ? undefined
												  : SD.toString().toLocaleLowerCase()
											  })
											  .some(function (SD) {
												return null === SD ||
												  undefined === SD
												  ? undefined
												  : SD.startsWith(SY)
											  })
										  })
										Sw.search.onChange(Sz)
									  } else {
										Sw.search.onChange(Sw.search.list)
									  }
									})(Sk.target.value)
								  },
								  InputProps: {
									startAdornment: Object(BG.jsx)(Bx.a, {
									  position: 'start',
									  children: Object(BG.jsx)(ia.a, {}),
									}),
								  },
								  variant: 'standard',
								}),
							  }),
							}),
						  }),
						],
					  }),
					  Sw.primaryActions && Sw.primaryActions.length > 0
						? Sw.primaryActions.map(function (Sk) {
							return Object(BG.jsx)(BG.Fragment, {
							  children:
								Sk.type && 'icon' === Sk.type
								  ? Object(BG.jsx)('div', {
									  className: Sx.appIcon,
									  children: Object(BG.jsx)('div', {
										className: Sx.appIconWrapper,
										children: Object(BG.jsx)(Bg.a, {
										  title: Sk.title,
										  placement: Sk.placement,
										  sx: {
											display: Sk.show ? '' : 'none',
											backgroundColor:
											  'rgba(97, 97, 97, 0.9)',
										  },
										  arrow: true,
										  children: Object(BG.jsx)('i', {
											onClick: Sk.action,
											style: {
											  display: Sk.show ? '' : 'none',
											  fontSize: '1.2em',
											},
											className: ''.concat(
											  Sk.icon,
											  ' fa-fw fa-lg'
											),
										  }),
										}),
									  }),
									})
								  : Object(BG.jsx)(BG.Fragment, {}),
							})
						  })
						: Object(BG.jsx)(BG.Fragment, {}),
					  Object(BG.jsxs)('div', {
						className: Sx.appList,
						children: [
						  Sw.children,
						  Object(BG.jsxs)('div', {
							className: 'flex-centered',
							style: {
							  display: Sw.emptyMessage ? 'flex' : 'none',
							  padding: '32px',
							  flexDirection: 'column',
							  textAlign: 'center',
							},
							children: [
							  Object(BG.jsx)('i', {
								className: 'fas fa-frown fa-w-16 fa-fw fa-3x',
								style: {
								  color: '#fff',
								  marginBottom: '32px',
								},
							  }),
							  Object(BG.jsx)(BO.a, {
								style: {
								  color: '#fff',
								  wordBreak: 'break-word',
								},
								variant: 'h6',
								gutterBottom: true,
								children: 'Nothing Here!',
							  }),
							],
						  }),
						],
					  }),
					],
				  }),
				}),
			  }),
			})
		  },
		  io = function () {
			var Sc = iS(),
			  Sx = Object(BP.c)(BZ),
			  Sk = Object(B9.a)(Sx, 2),
			  Sv = Sk[0],
			  SP = Sk[1],
			  SZ = Object(B4.useState)([]),
			  SV = Object(B9.a)(SZ, 2),
			  Sm = SV[0],
			  SY = SV[1],
			  Sz = Object(B4.useState)([]),
			  SF = Object(B9.a)(Sz, 2),
			  SX = SF[0],
			  SD = SF[1],
			  Sr = Object(BP.c)(Bl),
			  Sl = Object(B9.a)(Sr, 2),
			  Sd = Sl[0],
			  Sj = Sl[1],
			  SH = Object(BP.c)(Bd),
			  SI = Object(B9.a)(SH, 2),
			  SR = (SI[0], SI[1]),
			  SA = Object(B4.useState)(false),
			  SL = Object(B9.a)(SA, 2),
			  SJ = SL[0],
			  SC = SL[1],
			  SE = Object(B4.useState)(false),
			  SU = Object(B9.a)(SE, 2),
			  SW = SU[0],
			  M0 = SU[1],
			  M1 = Object(B4.useState)(false),
			  M2 = Object(B9.a)(M1, 2),
			  M3 = M2[0],
			  M4 = M2[1],
			  M5 = Object(B4.useState)(false),
			  M6 = Object(B9.a)(M5, 2),
			  M7 = M6[0],
			  M8 = M6[1],
			  M9 = Object(B4.useState)(false),
			  MB = Object(B9.a)(M9, 2),
			  Mi = MB[0],
			  MS = MB[1],
			  MM = Object(B4.useState)(''),
			  Mp = Object(B9.a)(MM, 2),
			  Ma = Mp[0],
			  Ms = Mp[1],
			  Mo = Object(B4.useState)(''),
			  MQ = Object(B9.a)(Mo, 2),
			  MO = MQ[0],
			  Mn = MQ[1],
			  MK = Object(B4.useState)(''),
			  Mb = Object(B9.a)(MK, 2),
			  Mg = Mb[0],
			  MT = Mb[1],
			  MN = Object(B4.useState)(''),
			  MG = Object(B9.a)(MN, 2),
			  My = MG[0],
			  Mu = MG[1]
			Object(B4.useEffect)(function () {
			  Ba('getContactsData', {}).then(function (Mk) {
				SY(Mk)
				SD(Mk)
			  })
			}, [])
			var Mf = function (Mk) {
				var Mv = ('' + Mk)
				  .replace(/\D/g, '')
				  .match(/^(\d{3})(\d{3})(\d{4})$/)
				return Mv ? '(' + Mv[1] + ') ' + Mv[2] + '-' + Mv[3] : Mk
			  },
			  Mh = function (Mk) {
				{
				  for (
					var MP = '', MV = '0123456789'.length, Mm = 0;
					Mm < Mk;
					Mm++
				  ) {
					MP += '0123456789'.charAt(Math.floor(Math.random() * MV))
				  }
				  return MP
				}
			  },
			  Mq = function (Mk) {
				SP(Mk.currentTarget.id)
			  },
			  Mw = function () {
				SP('')
			  },
			  Mc = function (Mk) {
				M0(true)
				;(function (Mv) {
				  MT(Mv)
				})(Mk.currentTarget.id)
			  },
			  Mx = function (Mk) {
				var MP = Mk.currentTarget.id
				Ba('removePhoneContact', { id: Mk.currentTarget.id }).then(
				  function (MZ) {
					{
					  if (MZ.meta.ok) {
						var Mm = SX.filter(function (Mz) {
						  return Mz.number.toString() !== MP
						})
						SD(Mm)
					  }
					}
				  }
				)
			  }
			return (
			  Bi('closeApps', function () {
				SC(false)
				M0(false)
				M4(false)
				M8(false)
				MS(false)
				SC(false)
				M0(false)
				Ms('')
				Mn('')
				MT('')
				Mu('')
			  }),
			  Object(BG.jsxs)(BG.Fragment, {
				children: [
				  Object(BG.jsx)('div', {
					className: Sc.contactModalContainer,
					style: { display: SJ ? '' : 'none' },
					children: Object(BG.jsxs)('div', {
					  className: Sc.contactModalInnerContainer,
					  children: [
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: M3 ? '' : 'none' },
						  children: Object(BG.jsxs)('div', {
							className: 'lds-spinner',
							children: [
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: M7 ? '' : 'none' },
						  children: Object(BG.jsx)(Bv.Checkmark, {
							size: '56px',
							color: '#009688',
						  }),
						}),
						Object(BG.jsxs)('div', {
						  className: 'component-simple-form',
						  style: { display: Mi ? 'none' : '' },
						  children: [
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)(Bw.a, {
								fullWidth: true,
								sx: { width: '100%' },
								children: Object(BG.jsx)(Bc.a, {
								  id: 'input-with-icon-textfield',
								  label: 'Name',
								  variant: 'standard',
								  onChange: function (Mk) {
									Mn(Mk.target.value)
								  },
								  value: MO,
								  InputProps: {
									startAdornment: Object(BG.jsx)(Bx.a, {
									  position: 'start',
									  children: Object(BG.jsx)(i9.a, {}),
									}),
								  },
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Number',
									variant: 'standard',
									onChange: function (Mk) {
									  Ms(Mk.target.value)
									},
									value: Ma,
									inputProps: { maxLength: 10 },
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)(ii.a, {}),
									  }),
									},
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  className: 'validation-messages',
							}),
							Object(BG.jsxs)('div', {
							  className: 'buttons',
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  SC(false)
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Cancel',
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  M4(true)
									  MS(true)
									  Ba('addPhoneContact', {
										number: Ma,
										name: MO,
									  }).then(function (Mv) {
										{
										  if (Mv.meta.ok) {
											var MZ = {
												id: Mh(10),
												name: MO,
												number: Ma,
											  },
											  MV = [].concat(
												Object(B8.a)(SX || []),
												[MZ]
											  )
											Ms('')
											Mn('')
											SD(MV)
										  }
										}
									  })
									  Ms('')
									  Mn('')
									  setTimeout(function () {
										M4(false)
										M8(true)
										setTimeout(function () {
										  M8(false)
										  SC(false)
										  MS(false)
										}, 1500)
									  }, 500)
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Submit',
								  }),
								}),
							  ],
							}),
						  ],
						}),
					  ],
					}),
				  }),
				  Object(BG.jsx)('div', {
					className: Sc.contactMessageModalContainer,
					style: { display: SW ? '' : 'none' },
					children: Object(BG.jsxs)('div', {
					  className: Sc.contactMessageModalInnerContainer,
					  children: [
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: M3 ? '' : 'none' },
						  children: Object(BG.jsxs)('div', {
							className: 'lds-spinner',
							children: [
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: M7 ? '' : 'none' },
						  children: Object(BG.jsx)(Bv.Checkmark, {
							size: '56px',
							color: '#009688',
						  }),
						}),
						Object(BG.jsxs)('div', {
						  className: 'component-simple-form',
						  style: { display: Mi ? 'none' : '' },
						  children: [
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Number',
									variant: 'standard',
									onChange: function (Mk) {
									  MT(Mk.target.value)
									},
									value: Mg,
									inputProps: { maxLength: 10 },
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)(Bw.a, {
								fullWidth: true,
								sx: { width: '100%' },
								children: Object(BG.jsx)(Bc.a, {
								  multiline: true,
								  maxRows: 10,
								  id: 'input-with-icon-textfield',
								  label: 'Message',
								  variant: 'standard',
								  onChange: function (Mk) {
									Mu(Mk.target.value)
								  },
								  defaultValue: My,
								  value: My,
								}),
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: 'buttons',
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  M0(false)
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Cancel',
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  M4(true)
									  MS(true)
									  Ba('sendMessage', {
										number: Mg,
										message: My,
									  }).then(function (Mk) {
										MT('')
										Mu('')
										M4(false)
										M8(true)
										setTimeout(function () {
										  M8(false)
										  M0(false)
										  MS(false)
										}, 1000)
									  })
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Submit',
								  }),
								}),
							  ],
							}),
						  ],
						}),
					  ],
					}),
				  }),
				  Object(BG.jsx)(is, {
					emptyMessage: 0 === SX.length,
					primaryActions: [
					  {
						type: 'icon',
						title: 'Add Contact',
						placement: 'left',
						icon: 'fas fa-user-plus fa-w-16',
						action: function (Mk) {
						  SC(true)
						  MT(Mk.currentTarget.id)
						},
						show: true,
					  },
					],
					search: {
					  filter: ['name', 'number'],
					  list: Sm,
					  onChange: SD,
					},
					children:
					  SX && SX.length > 0
						? SX.map(function (Mk) {
							var Mv
							return Object(BG.jsx)(
							  'div',
							  {
								id: Mk.number,
								className: 'component-paper cursor-pointer',
								onMouseEnter: Mq,
								onMouseLeave: Mw,
								children: Object(BG.jsxs)('div', {
								  className: 'main-container',
								  children: [
									Object(BG.jsx)('div', {
									  className: 'image',
									  children: Object(BG.jsx)('i', {
										className:
										  'fas fa-user-circle fa-w-16 fa-fw fa-3x',
									  }),
									}),
									Object(BG.jsxs)('div', {
									  className: 'details',
									  children: [
										Object(BG.jsx)('div', {
										  className: 'title',
										  children: Object(BG.jsx)(BO.a, {
											style: {
											  color: '#fff',
											  wordBreak: 'break-word',
											},
											variant: 'body2',
											gutterBottom: true,
											children: Mk.name,
										  }),
										}),
										Object(BG.jsx)('div', {
										  className: 'description',
										  children: Object(BG.jsx)('div', {
											className: 'flex-row',
											children: Object(BG.jsx)(BO.a, {
											  style: {
												color: '#fff',
												wordBreak: 'break-word',
											  },
											  variant: 'body2',
											  gutterBottom: true,
											  children: Mf(Mk.number),
											}),
										  }),
										}),
									  ],
									}),
									Object(BG.jsxs)('div', {
									  className:
										(null === Sv || undefined === Sv
										  ? undefined
										  : Sv.toString()) ===
										(null === Mk ||
										undefined === Mk ||
										null === (Mv = Mk.number) ||
										undefined === Mv
										  ? undefined
										  : Mv.toString())
										  ? 'actions actions-show'
										  : 'actions',
									  children: [
										Object(BG.jsx)(Bg.a, {
										  title: 'Remove Contact',
										  placement: 'top',
										  sx: {
											backgroundColor:
											  'rgba(97, 97, 97, 0.9)',
										  },
										  arrow: true,
										  children: Object(BG.jsx)('div', {
											children: Object(BG.jsx)('i', {
											  onClick: Mx,
											  id: Mk.number,
											  className:
												'fas fa-user-slash fa-w-16 fa-fw fa-lg',
											}),
										  }),
										}),
										Object(BG.jsx)(Bg.a, {
										  title: 'Call',
										  placement: 'top',
										  sx: {
											backgroundColor:
											  'rgba(97, 97, 97, 0.9)',
										  },
										  arrow: true,
										  children: Object(BG.jsx)('div', {
											children: Object(BG.jsx)('i', {
											  onClick: function () {
												return (function (MV, Mm) {
												  Ba('rd-ui:callStart', {
													number: Mm,
												  })
												  var MY = Mh(4),
													Mz = Mf(MV),
													MF = BU()().unix(),
													MX = Sd,
													MD = {
													  id: MY,
													  number: Mm,
													  name: Mz,
													  date: MF,
													  state: 'out',
													},
													Mr = [].concat(
													  Object(B8.a)(MX || []),
													  [MD]
													)
												  Sj(Mr)
												  SR(Mr)
												})(Mk.name, Mk.number)
											  },
											  className:
												'fas fa-phone fa-w-16 fa-fw fa-lg',
											}),
										  }),
										}),
										Object(BG.jsx)(Bg.a, {
										  title: 'Message',
										  placement: 'top',
										  sx: {
											backgroundColor:
											  'rgba(97, 97, 97, 0.9)',
										  },
										  arrow: true,
										  children: Object(BG.jsx)('div', {
											children: Object(BG.jsx)('i', {
											  onClick: Mc,
											  id: Mk.number,
											  className:
												'fas fa-comment fa-w-16 fa-fw fa-lg',
											}),
										  }),
										}),
										Object(BG.jsx)(i7.CopyToClipboard, {
										  text: Mk.number,
										  children: Object(BG.jsx)(Bg.a, {
											title: 'Copy Number',
											placement: 'top',
											sx: {
											  backgroundColor:
												'rgba(97, 97, 97, 0.9)',
											},
											arrow: true,
											children: Object(BG.jsx)('div', {
											  children: Object(BG.jsx)('i', {
												className:
												  'fas fa-clipboard fa-w-16 fa-fw fa-lg',
											  }),
											}),
										  }),
										}),
									  ],
									}),
								  ],
								}),
							  },
							  Mk.number
							)
						  })
						: Object(BG.jsx)(BG.Fragment, {}),
				  }),
				],
			  })
			)
		  },
		  iQ = Object(i4.a)({
			callsCallModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			callsCallModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
			callsMessageModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			callsMessageModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
			callsAddContactModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			callsAddContactModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
		  }),
		  iO = function () {
			var Sc = iQ(),
			  Sx = Object(BP.c)(BZ),
			  Sk = Object(B9.a)(Sx, 2),
			  Sv = Sk[0],
			  SP = Sk[1],
			  SZ = Object(BP.c)(Bl),
			  SV = Object(B9.a)(SZ, 2),
			  Sm = SV[0],
			  SY = SV[1],
			  Sz = Object(BP.c)(Bd),
			  SF = Object(B9.a)(Sz, 2),
			  SX = SF[0],
			  SD = SF[1],
			  Sr = Object(B4.useState)(false),
			  Sl = Object(B9.a)(Sr, 2),
			  Sd = Sl[0],
			  Sj = Sl[1],
			  SH = Object(B4.useState)(false),
			  SI = Object(B9.a)(SH, 2),
			  SR = SI[0],
			  SA = SI[1],
			  SL = Object(B4.useState)(false),
			  SJ = Object(B9.a)(SL, 2),
			  SC = SJ[0],
			  SE = SJ[1],
			  SU = Object(B4.useState)(false),
			  SW = Object(B9.a)(SU, 2),
			  M0 = SW[0],
			  M1 = SW[1],
			  M2 = Object(B4.useState)(false),
			  M3 = Object(B9.a)(M2, 2),
			  M4 = M3[0],
			  M5 = M3[1],
			  M6 = Object(B4.useState)(''),
			  M7 = Object(B9.a)(M6, 2),
			  M8 = M7[0],
			  M9 = M7[1],
			  MB = Object(B4.useState)(false),
			  Mi = Object(B9.a)(MB, 2),
			  MS = Mi[0],
			  MM = Mi[1],
			  Mp = Object(B4.useState)(''),
			  Ma = Object(B9.a)(Mp, 2),
			  Ms = Ma[0],
			  Mo = Ma[1],
			  MQ = Object(B4.useState)(''),
			  MO = Object(B9.a)(MQ, 2),
			  Mn = MO[0],
			  MK = MO[1],
			  Mb = Object(B4.useState)(''),
			  Mg = Object(B9.a)(Mb, 2),
			  MT = Mg[0],
			  MN = Mg[1],
			  MG = Object(B4.useState)(''),
			  My = Object(B9.a)(MG, 2),
			  Mu = My[0],
			  Mf = My[1],
			  Mh = function (Mv) {
				SP(Mv.currentTarget.id)
			  },
			  Mq = function () {
				SP('')
			  },
			  Mw = function (Mv) {
				MM(true)
				;(function (MZ) {
				  Mo(MZ)
				})(Mv.currentTarget.id)
			  },
			  Mc = function (Mv) {
				M5(true)
				Mf(Mv.currentTarget.id)
			  },
			  Mx = function (Mv) {
				var MP = ('' + Mv)
				  .replace(/\D/g, '')
				  .match(/^(\d{3})(\d{3})(\d{4})$/)
				return MP ? '(' + MP[1] + ') ' + MP[2] + '-' + MP[3] : Mv
			  },
			  Mk = function (Mv) {
				for (
				  var MP = '', MV = '0123456789'.length, Mm = 0;
				  Mm < Mv;
				  Mm++
				) {
				  MP += '0123456789'.charAt(Math.floor(Math.random() * MV))
				}
				return MP
			  }
			return (
			  Bi('closeApps', function () {
				M1(false)
				MM(false)
				M5(false)
				Sj(false)
				SA(false)
				SE(false)
				M9('')
				Mo('')
				MK('')
				MN('')
				Mf('')
			  }),
			  Object(BG.jsxs)(BG.Fragment, {
				children: [
				  Object(BG.jsx)('div', {
					className: Sc.callsCallModalContainer,
					style: { display: M0 ? '' : 'none' },
					children: Object(BG.jsxs)('div', {
					  className: Sc.callsCallModalInnerContainer,
					  children: [
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: Sd ? '' : 'none' },
						  children: Object(BG.jsxs)('div', {
							className: 'lds-spinner',
							children: [
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: SR ? '' : 'none' },
						  children: Object(BG.jsx)(Bv.Checkmark, {
							size: '56px',
							color: '#009688',
						  }),
						}),
						Object(BG.jsxs)('div', {
						  className: 'component-simple-form',
						  style: { display: SC ? 'none' : '' },
						  children: [
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Number',
									variant: 'standard',
									onChange: function (Mv) {
									  M9(Mv.target.value)
									},
									value: M8,
									inputProps: { maxLength: 10 },
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)(ii.a, {}),
									  }),
									},
								  }),
								}),
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: 'buttons',
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  M1(false)
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Cancel',
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  Ba('rd-ui:callStart', { number: M8 }).then(
										function (MP) {
										  M1(false)
										}
									  )
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Submit',
								  }),
								}),
							  ],
							}),
						  ],
						}),
					  ],
					}),
				  }),
				  Object(BG.jsx)('div', {
					className: Sc.callsMessageModalContainer,
					style: { display: MS ? '' : 'none' },
					children: Object(BG.jsxs)('div', {
					  className: Sc.callsMessageModalInnerContainer,
					  children: [
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: Sd ? '' : 'none' },
						  children: Object(BG.jsxs)('div', {
							className: 'lds-spinner',
							children: [
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: SR ? '' : 'none' },
						  children: Object(BG.jsx)(Bv.Checkmark, {
							size: '56px',
							color: '#009688',
						  }),
						}),
						Object(BG.jsxs)('div', {
						  className: 'component-simple-form',
						  style: { display: SC ? 'none' : '' },
						  children: [
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Number',
									variant: 'standard',
									onChange: function (Mv) {
									  Mo(Mv.target.value)
									},
									value: Ms,
									inputProps: { maxLength: 10 },
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)(Bw.a, {
								fullWidth: true,
								sx: { width: '100%' },
								children: Object(BG.jsx)(Bc.a, {
								  multiline: true,
								  maxRows: 10,
								  id: 'input-with-icon-textfield',
								  label: 'Message',
								  variant: 'standard',
								  onChange: function (Mv) {
									MK(Mv.target.value)
								  },
								  defaultValue: Mn,
								  value: Mn,
								}),
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: 'buttons',
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  MM(false)
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Cancel',
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  Sj(true)
									  SE(true)
									  Ba('sendMessage', {
										number: Ms,
										message: Mn,
									  }).then(function (MP) {
										Mo('')
										MK('')
										Sj(false)
										SA(true)
										setTimeout(function () {
										  SA(false)
										  MM(false)
										  SE(false)
										}, 1000)
									  })
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Submit',
								  }),
								}),
							  ],
							}),
						  ],
						}),
					  ],
					}),
				  }),
				  Object(BG.jsx)('div', {
					className: Sc.callsAddContactModalContainer,
					style: { display: M4 ? '' : 'none' },
					children: Object(BG.jsxs)('div', {
					  className: Sc.callsAddContactModalInnerContainer,
					  children: [
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: Sd ? '' : 'none' },
						  children: Object(BG.jsxs)('div', {
							className: 'lds-spinner',
							children: [
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: SR ? '' : 'none' },
						  children: Object(BG.jsx)(Bv.Checkmark, {
							size: '56px',
							color: '#009688',
						  }),
						}),
						Object(BG.jsxs)('div', {
						  className: 'component-simple-form',
						  style: { display: SC ? 'none' : '' },
						  children: [
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)(Bw.a, {
								fullWidth: true,
								sx: { width: '100%' },
								children: Object(BG.jsx)(Bc.a, {
								  id: 'input-with-icon-textfield',
								  label: 'Name',
								  variant: 'standard',
								  onChange: function (Mv) {
									MN(Mv.target.value)
								  },
								  value: MT,
								  InputProps: {
									startAdornment: Object(BG.jsx)(Bx.a, {
									  position: 'start',
									  children: Object(BG.jsx)(i9.a, {}),
									}),
								  },
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Number',
									variant: 'standard',
									onChange: function (Mv) {
									  Mf(Mv.target.value)
									},
									value: Mu,
									inputProps: { maxLength: 10 },
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)(ii.a, {}),
									  }),
									},
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  className: 'validation-messages',
							}),
							Object(BG.jsxs)('div', {
							  className: 'buttons',
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  M5(false)
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Cancel',
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  Sj(true)
									  SE(true)
									  Ba('addPhoneContact', {
										number: Mu,
										name: MT,
									  }).then(function (MP) {
										Mf('')
										MN('')
										Sj(false)
										SA(true)
										setTimeout(function () {
										  SA(false)
										  M5(false)
										  SE(false)
										}, 1000)
									  })
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Submit',
								  }),
								}),
							  ],
							}),
						  ],
						}),
					  ],
					}),
				  }),
				  Object(BG.jsx)(is, {
					emptyMessage: 0 === SX.length,
					primaryActions: [
					  {
						type: 'icon',
						title: 'Call Number',
						placement: 'left',
						icon: 'fas fa-phone fa-w-16',
						action: function (Mv) {
						  M1(true)
						},
						show: true,
					  },
					],
					search: {
					  filter: ['name', 'number'],
					  list: Sm,
					  onChange: SD,
					},
					children:
					  SX && SX.length > 0
						? SX.slice(0)
							.reverse()
							.map(function (Mv) {
							  return Object(BG.jsx)(
								'div',
								{
								  id: Mv.id,
								  className: 'component-paper cursor-pointer',
								  onMouseEnter: Mh,
								  onMouseLeave: Mq,
								  children: Object(BG.jsxs)('div', {
									className: 'main-container',
									children: [
									  Object(BG.jsx)('div', {
										className: 'image',
										children: Object(BG.jsx)('i', {
										  className: 'fas '.concat(
											'in' === Mv.state
											  ? 'fa-phone'
											  : 'fa-phone-alt',
											' fa-w-16 fa-fw fa-3x'
										  ),
										}),
									  }),
									  Object(BG.jsxs)('div', {
										className: 'details',
										children: [
										  Object(BG.jsx)('div', {
											className: 'title',
											children: Object(BG.jsx)(BO.a, {
											  style: {
												color: '#fff',
												wordBreak: 'break-word',
											  },
											  variant: 'body2',
											  gutterBottom: true,
											  children: Mx(Mv.name),
											}),
										  }),
										  Object(BG.jsx)('div', {
											className: 'description',
											children: Object(BG.jsx)('div', {
											  className: 'flex-row',
											  children: Object(BG.jsx)(BO.a, {
												style: {
												  color: '#fff',
												  wordBreak: 'break-word',
												},
												variant: 'body2',
												gutterBottom: true,
												children: BU()(
												  1000 * Number(Mv.date)
												).fromNow(),
											  }),
											}),
										  }),
										],
									  }),
									  Object(BG.jsxs)('div', {
										className:
										  Sv.toString() === Mv.id.toString()
											? 'actions actions-show'
											: 'actions',
										children: [
										  Object(BG.jsx)(Bg.a, {
											title: 'Call',
											placement: 'top',
											sx: {
											  backgroundColor:
												'rgba(97, 97, 97, 0.9)',
											},
											arrow: true,
											children: Object(BG.jsx)('div', {
											  children: Object(BG.jsx)('i', {
												onClick: function () {
												  return (
													(MV = Mv.name),
													void Ba('rd-ui:callStart', {
													  number: (Mm = Mv.number),
													}).then(function (MY) {
													  var Mz = Mk(4),
														MF = Mx(MV),
														MX = BU()().unix(),
														MD = Sm,
														Mr = {
														  id: Mz,
														  number: Mm,
														  name: MF,
														  date: MX,
														  state: 'out',
														},
														Ml = [].concat(
														  Object(B8.a)(MD || []),
														  [Mr]
														)
													  SY(Ml)
													  SD(Ml)
													})
												  )
												  var MV, Mm
												},
												className:
												  'fas fa-phone fa-w-16 fa-fw fa-lg',
											  }),
											}),
										  }),
										  Object(BG.jsx)(Bg.a, {
											title: 'Message',
											placement: 'top',
											sx: {
											  backgroundColor:
												'rgba(97, 97, 97, 0.9)',
											},
											arrow: true,
											children: Object(BG.jsx)('div', {
											  children: Object(BG.jsx)('i', {
												onClick: Mw,
												id: Mv.number,
												className:
												  'fas fa-comment fa-w-16 fa-fw fa-lg',
											  }),
											}),
										  }),
										  Object(BG.jsx)(Bg.a, {
											title: 'Add Contact',
											placement: 'top',
											sx: {
											  backgroundColor:
												'rgba(97, 97, 97, 0.9)',
											},
											arrow: true,
											children: Object(BG.jsx)('div', {
											  children: Object(BG.jsx)('i', {
												onClick: Mc,
												id: Mv.number,
												className:
												  'fas fa-user-plus fa-w-16 fa-fw fa-lg',
											  }),
											}),
										  }),
										],
									  }),
									],
								  }),
								},
								Mv.id
							  )
							})
						: Object(BG.jsx)(BG.Fragment, {}),
				  }),
				],
			  })
			)
		  },
		  iK = Object(i4.a)({
			erpingerOuterContainer: {
			  width: '100%',
			  height: '100%',
			  overflow: 'hidden',
			  position: 'absolute',
			  bottom: '0%',
			  opacity: '1',
			},
			erpingerInnerContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  position: 'absolute',
			  transition: 'all 400ms ease 0s',
			  willChange: 'left',
			},
			erpingerHeader: {
			  position: 'absolute',
			  top: '5%',
			  width: '100%',
			  background:
				'linear-gradient(114deg, rgba(255,175,156,1) 0%, rgba(153,48,91,1) 100%)',
			  height: '4.4vmin',
			  justifyContent: 'center',
			  alignSelf: 'center',
			  display: 'flex',
			  textAlign: 'center',
			  fontSize: '1.6vmin',
			  textShadow: '1px 0px 0px rgba(0, 0, 0, 1)',
			},
		  }),
		  ib = function () {
			var Sc = iK(),
			  Sx = Object(B4.useState)(''),
			  Sk = Object(B9.a)(Sx, 2),
			  Sv = Sk[0],
			  SP = Sk[1],
			  SZ = Object(BP.d)(Br),
			  SV = function (Sm) {
				undefined !== Sv &&
				  '' !== Sv &&
				  Ba('sendPlayerPing', {
					target: Sv,
					anon: Sm,
				  }).then(function (SF) {
					SF && SP('')
				  })
			  }
			return (
			  Bi('closeApps', function () {
				SP('')
			  }),
			  Object(BG.jsx)(BG.Fragment, {
				children: Object(BG.jsx)('div', {
				  className: Sc.erpingerOuterContainer,
				  style: { zIndex: 500 },
				  children: Object(BG.jsx)('div', {
					className: Sc.erpingerInnerContainer,
					children: Object(BG.jsxs)('div', {
					  className: 'erpinger-container',
					  children: [
						Object(BG.jsx)('div', {
						  className: Sc.erpingerHeader,
						  children: Object(BG.jsx)(BO.a, {
							style: {
							  color: '#fff',
							  wordBreak: 'break-word',
							  textAlign: 'center',
							  position: 'relative',
							  top: '15%',
							},
							variant: 'h6',
							gutterBottom: true,
							children: '\uD83C\uDF46 eRPinger \uD83C\uDF51',
						  }),
						}),
						Object(BG.jsx)('div', {
						  style: {
							position: 'absolute',
							top: '20%',
							left: '50%',
							transform: 'translate(-50%, -50%)',
						  },
						  children: Object(BG.jsx)(Bc.a, {
							id: 'input-with-icon-textfield',
							label: 'Paypal ID',
							onChange: function (Sm) {
							  SP(Sm.target.value)
							},
							value: Sv,
							InputProps: {
							  startAdornment: Object(BG.jsx)(Bx.a, {
								position: 'start',
								children: Object(BG.jsx)('i', {
								  className: 'fas fa-id-card',
								}),
							  }),
							},
							variant: 'standard',
						  }),
						}),
						Object(BG.jsx)('div', {
						  style: {
							position: 'absolute',
							top: '28%',
							left: '48.2%',
							transform: 'translate(-50%, -50%)',
						  },
						  children: Object(BG.jsx)(Bk.a, {
							sx: { width: '107.92%' },
							onClick: function () {
							  return SV(false)
							},
							variant: 'contained',
							color: 'info',
							size: 'medium',
							startIcon: Object(BG.jsx)('i', {
							  className: 'fas fa-map-pin',
							}),
							children: 'Send Ping',
						  }),
						}),
						Object(BG.jsx)('div', {
						  style: {
							display: SZ ? '' : 'none',
							position: 'absolute',
							top: '35%',
							left: '50%',
							transform: 'translate(-50%, -50%)',
						  },
						  children: Object(BG.jsx)(Bk.a, {
							onClick: function () {
							  return SV(true)
							},
							variant: 'contained',
							color: 'info',
							size: 'medium',
							startIcon: Object(BG.jsx)('i', {
							  className: 'fas fa-user-secret',
							}),
							children: 'Anon Ping',
						  }),
						}),
					  ],
					}),
				  }),
				}),
			  })
			)
		  },
		  ig = B2(237),
		  iT = function () {
			var Sc = Object(B4.useState)([]),
			  Sx = Object(B9.a)(Sc, 2),
			  Sk = Sx[0],
			  Sv = Sx[1],
			  SP = Object(B4.useState)([]),
			  SZ = Object(B9.a)(SP, 2),
			  SV = SZ[0],
			  Sm = SZ[1]
			return (
			  Object(B4.useEffect)(function () {
				Ba('getEmailData', {}).then(function (Sz) {
				  Sv(Sz)
				  Sm(Sz)
				})
			  }, []),
			  Bi('updateEmail', function (SY) {
				Sv(SY)
				Sm(SY)
			  }),
			  Object(BG.jsx)(BG.Fragment, {
				children: Object(BG.jsx)(is, {
				  emptyMessage: 0 === SV.length,
				  primaryActions: [],
				  search: {
					filter: ['from', 'subject', 'message'],
					list: Sk,
					onChange: Sm,
				  },
				  children:
					SV && SV.length > 0
					  ? SV.map(function (SY) {
						  return Object(BG.jsx)('div', {
							className: 'component-paper cursor-pointer',
							children: Object(BG.jsxs)('div', {
							  className: 'main-container',
							  children: [
								Object(BG.jsxs)('div', {
								  className: 'details',
								  children: [
									Object(BG.jsx)('div', {
									  className: 'title',
									  children: Object(BG.jsxs)(BO.a, {
										style: {
										  color: '#fff',
										  wordBreak: 'break-word',
										},
										variant: 'body2',
										gutterBottom: true,
										children: ['From: ', SY.from],
									  }),
									}),
									Object(BG.jsxs)('div', {
									  className: 'description',
									  children: [
										Object(BG.jsx)('div', {
										  className: 'flex-row',
										  children: Object(BG.jsxs)(BO.a, {
											style: {
											  color: '#fff',
											  wordBreak: 'break-word',
											},
											variant: 'body2',
											gutterBottom: true,
											children: ['Subject: ', SY.subject],
										  }),
										}),
										Object(BG.jsx)('div', {
										  className: 'flex-row',
										  children: Object(BG.jsx)(BO.a, {
											style: {
											  color: '#fff',
											  wordBreak: 'break-word',
											},
											variant: 'body2',
											gutterBottom: true,
											children: SY.message,
										  }),
										}),
									  ],
									}),
									Object(BG.jsx)(ig.a, {
									  variant: 'fullWidth',
									  sx: { borderColor: '#5e6d7d' },
									}),
									Object(BG.jsx)(BO.a, {
									  style: {
										color: '#fff',
										wordBreak: 'break-word',
										textAlign: 'center',
										marginTop: '5%',
									  },
									  variant: 'body2',
									  gutterBottom: true,
									  children: BU()(1000 * SY.time).fromNow(),
									}),
								  ],
								}),
								Object(BG.jsx)('div', { className: 'actions' }),
							  ],
							}),
						  })
						})
					  : Object(BG.jsx)(BG.Fragment, {}),
				}),
			  })
			)
		  },
		  iN = Object(i4.a)({
			ypComponentContainer: {
			  display: 'inline-block',
			  position: 'relative',
			  backgroundColor: '#ffeb3b',
			  height: 'fit-content',
			  padding: '2px 10px',
			  width: '100%',
			  borderRadius: '3px',
			  color: '#fff',
			  marginBottom: '6%',
			},
			ypPostModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			ypPostModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
		  }),
		  iG = function () {
			var Sc = iN(),
			  Sx = Object(B4.useState)([]),
			  Sk = Object(B9.a)(Sx, 2),
			  Sv = Sk[0],
			  SP = Sk[1],
			  SZ = Object(B4.useState)([]),
			  SV = Object(B9.a)(SZ, 2),
			  Sm = SV[0],
			  SY = SV[1],
			  Sz = Object(BP.c)(Bl),
			  SF = Object(B9.a)(Sz, 2),
			  SX = SF[0],
			  SD = SF[1],
			  Sr = Object(BP.c)(Bd),
			  Sl = Object(B9.a)(Sr, 2),
			  Sd = (Sl[0], Sl[1]),
			  Sj = Object(B4.useState)(false),
			  SH = Object(B9.a)(Sj, 2),
			  SI = SH[0],
			  SR = SH[1],
			  SA = Object(B4.useState)(false),
			  SL = Object(B9.a)(SA, 2),
			  SJ = SL[0],
			  SC = SL[1],
			  SE = Object(B4.useState)(false),
			  SU = Object(B9.a)(SE, 2),
			  SW = SU[0],
			  M0 = SU[1],
			  M1 = Object(B4.useState)(false),
			  M2 = Object(B9.a)(M1, 2),
			  M3 = M2[0],
			  M4 = M2[1],
			  M5 = Object(B4.useState)(''),
			  M6 = Object(B9.a)(M5, 2),
			  M7 = M6[0],
			  M8 = M6[1],
			  M9 = Object(B4.useState)(false),
			  MB = Object(B9.a)(M9, 2),
			  Mi = MB[0],
			  MS = MB[1]
			Object(B4.useEffect)(function () {
			  Ba('getYpData', {}).then(function (Ma) {
				SP(Ma.ads)
				SY(Ma.ads)
				MS(Ma.hasAd)
			  })
			}, [])
			var MM = function (Ma) {
				{
				  var Mo = ('' + Ma)
					.replace(/\D/g, '')
					.match(/^(\d{3})(\d{3})(\d{4})$/)
				  return Mo ? '(' + Mo[1] + ') ' + Mo[2] + '-' + Mo[3] : Ma
				}
			  },
			  Mp = function (Ma) {
				for (
				  var Ms = '', MQ = '0123456789'.length, MO = 0;
				  MO < Ma;
				  MO++
				) {
				  Ms += '0123456789'.charAt(Math.floor(Math.random() * MQ))
				}
				return Ms
			  }
			return (
			  Bi('updateYp', function (Ma) {
				SP(Ma)
				SY(Ma)
			  }),
			  Bi('closeApps', function () {
				M4(false)
				SR(false)
				M0(false)
				SC(false)
				M8('')
			  }),
			  Object(BG.jsxs)(BG.Fragment, {
				children: [
				  Object(BG.jsx)('div', {
					className: Sc.ypPostModalContainer,
					style: { display: M3 ? '' : 'none' },
					children: Object(BG.jsxs)('div', {
					  className: Sc.ypPostModalInnerContainer,
					  children: [
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: SI ? '' : 'none' },
						  children: Object(BG.jsxs)('div', {
							className: 'lds-spinner',
							children: [
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: SJ ? '' : 'none' },
						  children: Object(BG.jsx)(Bv.Checkmark, {
							size: '56px',
							color: '#009688',
						  }),
						}),
						Object(BG.jsxs)('div', {
						  className: 'component-simple-form',
						  style: { display: SW ? 'none' : '' },
						  children: [
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Ad',
									variant: 'standard',
									onChange: function (Ma) {
									  M8(Ma.target.value)
									},
									value: M7,
									multiline: true,
									maxRows: 10,
									inputProps: { maxLength: 255 },
									helperText: ''.concat(M7.length, '/255'),
								  }),
								}),
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: 'buttons',
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  M4(false)
									  M8('')
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Cancel',
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  SR(true)
									  M0(true)
									  Ba('postAd', { message: M7 }).then(
										function (Ms) {
										  true === Ms.success
											? (M8(''),
											  SP(Ms.data),
											  SY(Ms.data),
											  MS(Ms.hasAd),
											  SR(false),
											  SC(true),
											  setTimeout(function () {
												SC(false)
												M4(false)
												M0(false)
											  }, 1000))
											: (SR(false), M0(false), M8(''))
										}
									  )
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Submit',
								  }),
								}),
							  ],
							}),
						  ],
						}),
					  ],
					}),
				  }),
				  Object(BG.jsx)(is, {
					emptyMessage: 0 === Sm.length,
					primaryActions: [
					  {
						type: 'icon',
						title: 'Create Ad',
						placement: 'left',
						icon: 'fas fa-plus fa-w-16',
						action: function (Ma) {
						  M4(true)
						},
						show: !Mi,
					  },
					  {
						type: 'icon',
						title: 'Remove Ad',
						placement: 'left',
						icon: 'fas fa-times fa-w-16',
						action: function () {
						  Ba('removeYp', {}).then(function (Ms) {
							true === Ms.success &&
							  (SP(Ms.data), SY(Ms.data), MS(Ms.hasAd))
						  })
						},
						show: Mi,
					  },
					],
					search: {
					  filter: ['phonenr', 'message', 'number'],
					  list: Sv,
					  onChange: SY,
					},
					children:
					  Sm && Sm.length > 0
						? Sm.map(function (Ma) {
							return Object(BG.jsxs)('div', {
							  className: Sc.ypComponentContainer,
							  children: [
								Object(BG.jsx)(BO.a, {
								  style: {
									color: '#000',
									wordBreak: 'break-word',
								  },
								  variant: 'body1',
								  gutterBottom: true,
								  children: Ma.message,
								}),
								Object(BG.jsx)(ig.a, { variant: 'middle' }),
								Object(BG.jsxs)('div', {
								  style: {
									fontSize: '13px',
									display: 'flex',
									paddingBottom: '3vh',
								  },
								  children: [
									Object(BG.jsx)(Bg.a, {
									  title: 'Call',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
									  },
									  arrow: true,
									  children: Object(BG.jsx)(BO.a, {
										onClick: function () {
										  return (function (MQ) {
											{
											  Ba('rd-ui:callStart', {
												number: MQ,
											  })
											  var MO = Mp(4),
												Mn = BU()().unix(),
												MK = SX,
												Mb = {
												  id: MO,
												  number: MQ,
												  name: MQ,
												  date: Mn,
												  state: 'out',
												},
												Mg = [].concat(
												  Object(B8.a)(MK || []),
												  [Mb]
												)
											  SD(Mg)
											  Sd(Mg)
											}
										  })(Ma.phonenr)
										},
										style: {
										  color: '#000',
										  backgroundColor: 'transparent',
										  wordBreak: 'break-word',
										  position: 'absolute',
										  float: 'left',
										  bottom: '1%',
										},
										variant: 'body2',
										gutterBottom: true,
										children: MM(Ma.phonenr),
									  }),
									}),
									Object(BG.jsx)(BO.a, {
									  style: {
										color: '#000',
										wordBreak: 'break-word',
										position: 'absolute',
										float: 'right',
										right: '5%',
										bottom: '1%',
									  },
									  variant: 'body2',
									  gutterBottom: true,
									  children: Ma.name,
									}),
								  ],
								}),
							  ],
							})
						  })
						: Object(BG.jsx)(BG.Fragment, {}),
				  }),
				],
			  })
			)
		  },
		  iy = Object(i4.a)({
			twitterComponentContainer: {
			  display: 'inline-block',
			  position: 'relative',
			  backgroundColor: '#0c63c5',
			  height: 'fit-content',
			  padding: '2px 10px',
			  width: '100%',
			  borderRadius: '5px',
			  color: '#fff',
			  marginBottom: '6%',
			},
			twitterTwatModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			twitterTwatModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
		  }),
		  iu = B2(239),
		  ih = function (Sw) {
			var Sx = Object(B4.useState)(false),
			  Sk = Object(B9.a)(Sx, 2),
			  Sv = Sk[0],
			  SP = Sk[1],
			  SZ = Object(B4.useState)(false),
			  SV = Object(B9.a)(SZ, 2),
			  Sm = SV[0],
			  SY = SV[1]
			Bi('closeApps', function () {
			  SP(false)
			  SY(false)
			})
			var Sz = Sw.message.match(
				/\b(http|https)?(:\/\/)?(\S*)\.(\w{2,4})(.*)/g
			  ),
			  SF = Sw.message.split(Sz[0])[0],
			  SX = '\n\n Images Attached: ' + Sz[0].split(' ').length
			return Object(BG.jsxs)(BG.Fragment, {
			  children: [
				Object(BG.jsxs)(BO.a, {
				  style: {
					color: '#fff',
					wordBreak: 'break-word',
				  },
				  variant: 'body1',
				  gutterBottom: true,
				  children: ['@', Sw.sender],
				}),
				Object(BG.jsx)(BO.a, {
				  style: {
					color: '#fff',
					wordBreak: 'break-word',
					marginBottom: '0.25em',
				  },
				  variant: 'body2',
				  gutterBottom: true,
				  children: SF,
				}),
				Object(BG.jsxs)('div', {
				  onClick: function () {
					SP(!Sv)
				  },
				  className: 'component-image-container',
				  style: { marginBottom: '5%' },
				  children: [
					Object(BG.jsx)('div', {
					  children: Object(BG.jsx)(BO.a, {
						style: {
						  color: '#fff',
						  wordBreak: 'break-word',
						},
						variant: 'body2',
						gutterBottom: true,
						children: SX,
					  }),
					}),
					Object(BG.jsxs)('div', {
					  className: Sv
						? 'container'
						: 'container container-max-height',
					  children: [
						Object(BG.jsxs)('div', {
						  className: 'blocker',
						  style: { display: Sv ? 'none' : '' },
						  children: [
							Object(BG.jsx)('i', {
							  className: 'fas fa-eye fa-w-18 fa-fw fa-3x',
							  style: { color: 'black' },
							}),
							Object(BG.jsx)(BO.a, {
							  style: {
								color: '#fff',
								wordBreak: 'break-word',
							  },
							  variant: 'body1',
							  gutterBottom: true,
							  children: 'Click to View',
							}),
							Object(BG.jsx)(BO.a, {
							  style: {
								color: '#fff',
								textAlign: 'center',
							  },
							  variant: 'body2',
							  gutterBottom: true,
							  children:
								'Only reveal images from those you know are not total pricks',
							}),
						  ],
						}),
						Object(BG.jsx)('div', {
						  onMouseEnter: function () {
							Sv && SY(true)
						  },
						  onMouseLeave: function () {
							SY(false)
						  },
						  className: Sv ? 'image' : '',
						  style: {
							backgroundImage: Sv
							  ? 'url('.concat(Sz[0].split(' '), ')')
							  : '',
						  },
						}),
						Object(BG.jsx)('div', { className: 'spacer' }),
					  ],
					}),
					Object(BG.jsx)(iu.a, {
					  open: Sm,
					  style: {
						top: '49%',
						left: '42%',
					  },
					  placement: 'bottom-end',
					  disablePortal: false,
					  modifiers: [
						{
						  name: 'flip',
						  enabled: false,
						  options: {
							altBoundary: false,
							rootBoundary: 'document',
							padding: 8,
						  },
						},
						{
						  name: 'preventOverflow',
						  enabled: false,
						  options: {
							altAxis: false,
							altBoundary: true,
							tether: false,
							rootBoundary: 'document',
							padding: 8,
						  },
						},
					  ],
					  children: Object(BG.jsx)('div', {
						children: Object(BG.jsx)('img', {
						  alt: 'useful',
						  src: Sz[0].split(' '),
						  style: {
							maxHeight: '600px',
							maxWidth: '800px',
						  },
						}),
					  }),
					}),
				  ],
				}),
			  ],
			})
		  },
		  iq = function () {
			{
			  var Sc = iy(),
				Sx = Object(B4.useState)([]),
				Sk = Object(B9.a)(Sx, 2),
				Sv = Sk[0],
				SP = Sk[1],
				SZ = Object(B4.useState)([]),
				SV = Object(B9.a)(SZ, 2),
				Sm = SV[0],
				SY = SV[1],
				Sz = Object(B4.useState)(false),
				SF = Object(B9.a)(Sz, 2),
				SX = SF[0],
				SD = SF[1],
				Sr = Object(B4.useState)(false),
				Sl = Object(B9.a)(Sr, 2),
				Sd = Sl[0],
				Sj = Sl[1],
				SH = Object(B4.useState)(false),
				SI = Object(B9.a)(SH, 2),
				SR = SI[0],
				SA = SI[1],
				SL = Object(B4.useState)(false),
				SJ = Object(B9.a)(SL, 2),
				SC = SJ[0],
				SE = SJ[1],
				SU = Object(B4.useState)(''),
				SW = Object(B9.a)(SU, 2),
				M0 = SW[0],
				M1 = SW[1],
				M2 = Object(B4.useState)(false),
				M3 = Object(B9.a)(M2, 2),
				M4 = (M3[0], M3[1]),
				M5 = Object(B4.useState)(''),
				M6 = Object(B9.a)(M5, 2),
				M7 = (M6[0], M6[1]),
				M8 = Object(BP.c)(BC),
				M9 = Object(B9.a)(M8, 2),
				MB = M9[0]
			  return (
				M9[1],
				Object(B4.useEffect)(function () {
				  Ba('getTwitterData', {}).then(function (MM) {
					SP(MM)
					SY(MM)
				  })
				}, []),
				(Bi('updateTwitter', function (MS) {
				  SP(MS)
				  SY(MS)
				}),
				Bi('closeApps', function () {
				  SE(false)
				  SD(false)
				  SA(false)
				  Sj(false)
				  M4(false)
				  M7('')
				  M1('')
				}),
				Object(BG.jsxs)(BG.Fragment, {
				  children: [
					Object(BG.jsx)('div', {
					  className: Sc.twitterTwatModalContainer,
					  style: { display: SC ? '' : 'none' },
					  children: Object(BG.jsxs)('div', {
						className: Sc.twitterTwatModalInnerContainer,
						children: [
						  Object(BG.jsx)('div', {
							className: 'spinner-wrapper',
							style: { display: SX ? '' : 'none' },
							children: Object(BG.jsxs)('div', {
							  className: 'lds-spinner',
							  children: [
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
							  ],
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'spinner-wrapper',
							style: { display: Sd ? '' : 'none' },
							children: Object(BG.jsx)(Bv.Checkmark, {
							  size: '56px',
							  color: '#009688',
							}),
						  }),
						  Object(BG.jsxs)('div', {
							className: 'component-simple-form',
							style: { display: SR ? 'none' : '' },
							children: [
							  Object(BG.jsx)('div', {
								children: Object(BG.jsx)('div', {
								  className: 'input-wrapper',
								  children: Object(BG.jsx)(Bw.a, {
									fullWidth: true,
									sx: { width: '100%' },
									children: Object(BG.jsx)(Bc.a, {
									  id: 'input-with-icon-textfield',
									  label: 'Twat',
									  variant: 'standard',
									  onChange: function (MS) {
										M1(MS.target.value)
									  },
									  value: M0,
									  multiline: true,
									  maxRows: 10,
									  inputProps: { maxLength: 255 },
									  helperText: ''.concat(M0.length, '/255'),
									}),
								  }),
								}),
							  }),
							  Object(BG.jsxs)('div', {
								className: 'buttons',
								children: [
								  Object(BG.jsx)('div', {
									children: Object(BG.jsx)(Bk.a, {
									  onClick: function () {
										SE(false)
										M1('')
									  },
									  size: 'small',
									  color: 'warning',
									  variant: 'contained',
									  children: 'Cancel',
									}),
								  }),
								  Object(BG.jsx)('div', {
									children: Object(BG.jsx)(Bk.a, {
									  onClick: function () {
										SD(true)
										SA(true)
										Ba('postTwitter', { message: M0 }).then(
										  function (MM) {
											true === MM.success
											  ? (M1(''),
												SP(MM.data),
												SY(MM.data),
												SD(false),
												Sj(true),
												setTimeout(function () {
												  Sj(false)
												  SE(false)
												  SA(false)
												}, 1000))
											  : (SD(false),
												SA(false),
												M7(MM.message),
												M4(true),
												M1(''))
										  }
										)
									  },
									  size: 'small',
									  color: 'success',
									  variant: 'contained',
									  children: 'Submit',
									}),
								  }),
								],
							  }),
							],
						  }),
						],
					  }),
					}),
					Object(BG.jsx)(is, {
					  emptyMessage: 0 === Sm.length,
					  primaryActions: [
						{
						  type: 'icon',
						  title: 'Twat',
						  placement: 'left',
						  icon: 'fab fa-twitter fa-w-16',
						  action: function (MS) {
							SE(true)
						  },
						  show: true,
						},
					  ],
					  search: {
						filter: ['sender', 'message'],
						list: Sv,
						onChange: SY,
					  },
					  children: Object(BG.jsx)('div', {
						id: 'twats',
						children:
						  Sm && Sm.length > 0
							? Sm.map(function (MS) {
								return Object(BG.jsx)(BG.Fragment, {
								  children: Object(BG.jsxs)('div', {
									className: Sc.twitterComponentContainer,
									children: [
									  (MS.message.indexOf('imgur.com') >= 0 &&
										MB) ||
									  (MS.message.indexOf('discordapp.com') >=
										0 &&
										MB)
										? Object(BG.jsx)(ih, {
											sender: MS.sender,
											message: MS.message,
											date: MS.date,
										  })
										: Object(BG.jsxs)(BG.Fragment, {
											children: [
											  Object(BG.jsxs)(BO.a, {
												style: {
												  color: '#fff',
												  wordBreak: 'break-word',
												},
												variant: 'body1',
												gutterBottom: true,
												children: ['@', MS.sender],
											  }),
											  Object(BG.jsx)(BO.a, {
												style: {
												  color: '#fff',
												  wordBreak: 'break-word',
												  marginBottom: '0.25em',
												},
												variant: 'body2',
												gutterBottom: true,
												children: MS.message,
											  }),
											],
										  }),
									  Object(BG.jsxs)('div', {
										style: {
										  fontSize: '13px',
										  display: 'flex',
										  paddingBottom: '1vh',
										},
										children: [
										  Object(BG.jsx)(Bg.a, {
											title: 'Reply',
											placement: 'top',
											sx: {
											  backgroundColor:
												'rgba(97, 97, 97, 0.9)',
											},
											arrow: true,
											children: Object(BG.jsx)('i', {
											  onClick: function () {
												return (
												  (Mp = '@'.concat(
													MS.sender,
													' '
												  )),
												  M1(Mp),
												  void SE(true)
												)
												var Mp
											  },
											  className: 'fas fa-reply',
											}),
										  }),
										  Object(BG.jsx)(Bg.a, {
											title: 'Retwat',
											placement: 'top',
											sx: {
											  backgroundColor:
												'rgba(97, 97, 97, 0.9)',
											},
											arrow: true,
											children: Object(BG.jsx)('i', {
											  onClick: function () {
												return (
												  (Mp = 'RT @'
													.concat(MS.sender, ' ')
													.concat(MS.message)),
												  M1(Mp),
												  void SE(true)
												)
												var Mp
											  },
											  className: 'fas fa-retweet',
											  style: { paddingLeft: '1vh' },
											}),
										  }),
										  Object(BG.jsx)(Bg.a, {
											title: 'Report',
											placement: 'top',
											sx: {
											  backgroundColor:
												'rgba(97, 97, 97, 0.9)',
											},
											arrow: true,
											children: Object(BG.jsx)('i', {
											  className: 'fas fa-flag',
											  style: { paddingLeft: '1vh' },
											}),
										  }),
										  Object(BG.jsx)(BO.a, {
											style: {
											  color: '#fff',
											  wordBreak: 'break-word',
											  position: 'absolute',
											  float: 'right',
											  right: '5%',
											  bottom: '1%',
											},
											variant: 'body2',
											gutterBottom: true,
											children: BU()(
											  1000 * MS.date
											).fromNow(),
										  }),
										],
									  }),
									],
								  }),
								})
							  })
							: Object(BG.jsx)(BG.Fragment, {}),
					  }),
					}),
				  ],
				}))
			  )
			}
		  },
		  iw = B2(260),
		  ic = function (Sw) {
			var Sx = Object(B4.useState)(false),
			  Sk = Object(B9.a)(Sx, 2),
			  Sv = Sk[0],
			  SP = Sk[1],
			  SZ = Object(BP.c)(Bz),
			  SV = Object(B9.a)(SZ, 2),
			  Sm = (SV[0], SV[1]),
			  SY = Object(BP.c)(BD),
			  Sz = Object(B9.a)(SY, 2),
			  SF = (Sz[0], Sz[1]),
			  SX = Sw.engine / 10,
			  SD = Sw.body / 10
			return Object(BG.jsx)(BG.Fragment, {
			  children: Object(BG.jsxs)('div', {
				className: 'component-paper cursor-pointer',
				onClick: function () {
				  SP(!Sv)
				},
				children: [
				  Object(BG.jsxs)('div', {
					className: 'main-container',
					children: [
					  Object(BG.jsx)('div', {
						className: 'image',
						children: Object(BG.jsx)('i', {
						  className: 'fas fa-'.concat(
							Sw.type,
							' fa-w-16 fa-fw fa-3x'
						  ),
						}),
					  }),
					  Object(BG.jsxs)('div', {
						className: 'details',
						children: [
						  Object(BG.jsx)('div', {
							className: 'title',
							children: Object(BG.jsx)(BO.a, {
							  style: {
								color: '#fff',
								wordBreak: 'break-word',
							  },
							  variant: 'body2',
							  gutterBottom: true,
							  children: Sw.plate,
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'description',
							children: Object(BG.jsx)('div', {
							  className: 'flex-row',
							  children: Object(BG.jsx)(BO.a, {
								style: {
								  color: '#fff',
								  wordBreak: 'break-word',
								},
								variant: 'body2',
								gutterBottom: true,
								children: Sw.model,
							  }),
							}),
						  }),
						],
					  }),
					  Object(BG.jsx)('div', { className: 'actions' }),
					  Object(BG.jsx)('div', {
						className: 'image',
						children: Object(BG.jsx)(BO.a, {
						  style: {
							color: '#fff',
							wordBreak: 'break-word',
						  },
						  variant: 'body2',
						  gutterBottom: true,
						  children: Sw.state,
						}),
					  }),
					],
				  }),
				  Object(BG.jsxs)(iw.a, {
					in: Sv,
					timeout: 'auto',
					unmountOnExit: true,
					children: [
					  Object(BG.jsx)(Bw.a, {
						sx: {
						  width: '85%',
						  marginLeft: '7.5%',
						  marginBottom: '1.5%',
						},
						children: Object(BG.jsx)(Bc.a, {
						  id: 'input-with-icon-textfield',
						  variant: 'standard',
						  value: Sw.garage,
						  InputProps: {
							readOnly: true,
							startAdornment: Object(BG.jsx)(Bx.a, {
							  position: 'start',
							  children: Object(BG.jsx)('i', {
								className: 'fas fa-map-marker-alt',
							  }),
							}),
						  },
						}),
					  }),
					  Object(BG.jsx)(Bw.a, {
						sx: {
						  width: '85%',
						  marginLeft: '7.5%',
						  marginBottom: '1.5%',
						},
						children: Object(BG.jsx)(Bc.a, {
						  id: 'input-with-icon-textfield',
						  variant: 'standard',
						  value: Sw.plate,
						  InputProps: {
							readOnly: true,
							startAdornment: Object(BG.jsx)(Bx.a, {
							  position: 'start',
							  children: Object(BG.jsx)('i', {
								className: 'fas fa-closed-captioning',
							  }),
							}),
						  },
						}),
					  }),
					  Object(BG.jsx)(Bw.a, {
						sx: {
						  width: '85%',
						  marginLeft: '7.5%',
						  marginBottom: '1.5%',
						},
						children: Object(BG.jsx)(Bc.a, {
						  id: 'input-with-icon-textfield',
						  variant: 'standard',
						  value: ''.concat(SX, '%'),
						  InputProps: {
							readOnly: true,
							startAdornment: Object(BG.jsx)(Bx.a, {
							  position: 'start',
							  children: Object(BG.jsx)('i', {
								className: 'fas fa-oil-can',
							  }),
							}),
						  },
						}),
					  }),
					  Object(BG.jsx)(Bw.a, {
						sx: {
						  width: '85%',
						  marginLeft: '7.5%',
						  marginBottom: '1.5%',
						},
						children: Object(BG.jsx)(Bc.a, {
						  id: 'input-with-icon-textfield',
						  variant: 'standard',
						  value: ''.concat(SD, '%'),
						  InputProps: {
							readOnly: true,
							startAdornment: Object(BG.jsx)(Bx.a, {
							  position: 'start',
							  children: Object(BG.jsx)('i', {
								className: 'fas fa-car-crash',
							  }),
							}),
						  },
						}),
					  }),
					  Object(BG.jsx)('div', {
						className: 'buttons',
						style: {
						  display: 'flex',
						  justifyContent: 'center',
						  marginTop: '1%',
						},
						children: Object(BG.jsxs)(BW.a, {
						  direction: 'row',
						  spacing: 2,
						  children: [
							Object(BG.jsx)(Bk.a, {
							  id: Sw.plate,
							  onClick: function (Sr) {
								return (function (Sl) {
								  Sl.stopPropagation()
								  Ba('rd-ui:carActionTrack', {
									car: { location: Sw.location },
								  })
								})(Sr)
							  },
							  size: 'small',
							  color: 'success',
							  variant: 'contained',
							  children: 'Track',
							}),
							Object(BG.jsx)(Bk.a, {
							  id: Sw.plate,
							  onClick: function (Sr) {
								return (function (Sj) {
								  Sj.stopPropagation()
								  Ba('rd-ui:carActionSpawn', {
									car: {
									  plate: Sw.plate,
									  location: Sw.location,
									  model: Sw.model,
									  appearance: Sw.appearance,
									  mods: Sw.mods,
									  damage: Sw.damage,
									},
								  })
								})(Sr)
							  },
							  size: 'small',
							  color: 'success',
							  variant: 'contained',
							  style: { display: Sw.spawnable ? '' : 'none' },
							  children: 'Spawn',
							}),
							Object(BG.jsx)(Bk.a, {
							  id: Sw.plate,
							  onClick: function (Sr) {
								return (function (Sl) {
								  Sl.stopPropagation()
								  Sm(true)
								  SF(Sw.plate)
								})(Sr)
							  },
							  size: 'small',
							  color: 'error',
							  variant: 'contained',
							  style: {
								display: 'Out' === Sw.state ? '' : 'none',
							  },
							  children: 'Sell',
							}),
						  ],
						}),
					  }),
					],
				  }),
				],
			  }),
			})
		  },
		  ix = Object(i4.a)({
			garageSellCarModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			garageSellCarModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
			input: {
			  '& input[type=number]': { '-moz-appearance': 'textfield' },
			  '& input[type=number]::-webkit-outer-spin-button': {
				'-webkit-appearance': 'none',
				margin: 0,
			  },
			  '& input[type=number]::-webkit-inner-spin-button': {
				'-webkit-appearance': 'none',
				margin: 0,
			  },
			},
		  }),
		  ik = function () {
			{
			  var Sc = ix(),
				Sx = Object(B4.useState)([]),
				Sk = Object(B9.a)(Sx, 2),
				Sv = Sk[0],
				SP = Sk[1],
				SZ = Object(B4.useState)([]),
				SV = Object(B9.a)(SZ, 2),
				Sm = SV[0],
				SY = SV[1],
				Sz = Object(BP.c)(Bz),
				SF = Object(B9.a)(Sz, 2),
				SX = SF[0],
				SD = SF[1],
				Sr = Object(BP.c)(BF),
				Sl = Object(B9.a)(Sr, 2),
				Sd = Sl[0],
				Sj = Sl[1],
				SH = Object(BP.c)(BX),
				SI = Object(B9.a)(SH, 2),
				SR = SI[0],
				SA = SI[1],
				SL = Object(BP.c)(BD),
				SJ = Object(B9.a)(SL, 2),
				SC = SJ[0],
				SE = (SJ[1], Object(B4.useState)(false)),
				SU = Object(B9.a)(SE, 2),
				SW = SU[0],
				M0 = SU[1],
				M1 = Object(B4.useState)(false),
				M2 = Object(B9.a)(M1, 2),
				M3 = M2[0],
				M4 = M2[1],
				M5 = Object(B4.useState)(false),
				M6 = Object(B9.a)(M5, 2),
				M7 = M6[0],
				M8 = M6[1]
			  return (
				Object(B4.useEffect)(function () {
				  Ba('rd-ui:getCars', {}).then(function (MB) {
					SP(MB.data)
					SY(MB.data)
				  })
				}, []),
				Bi('closeApps', function () {
				  SD(false)
				  M0(false)
				  M4(false)
				  M8(false)
				}),
				Object(BG.jsx)(BG.Fragment, {
				  children: Object(BG.jsxs)(is, {
					emptyMessage: 0 === Sm.length,
					primaryActions: [],
					search: {
					  filter: ['model', 'license_plate'],
					  list: Sv,
					  onChange: SY,
					},
					children: [
					  Object(BG.jsx)('div', {
						className: Sc.garageSellCarModalContainer,
						style: { display: SX ? '' : 'none' },
						children: Object(BG.jsxs)('div', {
						  className: Sc.garageSellCarModalInnerContainer,
						  children: [
							Object(BG.jsx)('div', {
							  className: 'spinner-wrapper',
							  style: { display: SW ? '' : 'none' },
							  children: Object(BG.jsxs)('div', {
								className: 'lds-spinner',
								children: [
								  Object(BG.jsx)('div', {}),
								  Object(BG.jsx)('div', {}),
								  Object(BG.jsx)('div', {}),
								  Object(BG.jsx)('div', {}),
								  Object(BG.jsx)('div', {}),
								  Object(BG.jsx)('div', {}),
								  Object(BG.jsx)('div', {}),
								  Object(BG.jsx)('div', {}),
								  Object(BG.jsx)('div', {}),
								  Object(BG.jsx)('div', {}),
								  Object(BG.jsx)('div', {}),
								  Object(BG.jsx)('div', {}),
								],
							  }),
							}),
							Object(BG.jsx)('div', {
							  className: 'spinner-wrapper',
							  style: { display: M3 ? '' : 'none' },
							  children: Object(BG.jsx)(Bv.Checkmark, {
								size: '56px',
								color: '#009688',
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: 'component-simple-form',
							  style: { display: SW || M7 ? 'none' : '' },
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)('div', {
									className: 'input-wrapper',
									children: Object(BG.jsx)(Bw.a, {
									  fullWidth: true,
									  sx: { width: '100%' },
									  children: Object(BG.jsx)(Bc.a, {
										className: Sc.input,
										id: 'input-with-icon-textfield',
										type: 'number',
										label: 'State ID',
										variant: 'standard',
										onChange: function (M9) {
										  return Sj(parseInt(M9.target.value))
										},
										value: Sd,
										InputProps: {
										  startAdornment: Object(BG.jsx)(Bx.a, {
											position: 'start',
											children: Object(BG.jsx)('i', {
											  className: 'fas fa-id-card',
											}),
										  }),
										},
									  }),
									}),
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)('div', {
									className: 'input-wrapper',
									children: Object(BG.jsx)(Bw.a, {
									  fullWidth: true,
									  sx: { width: '100%' },
									  children: Object(BG.jsx)(Bc.a, {
										className: Sc.input,
										id: 'input-with-icon-textfield',
										type: 'number',
										label: 'Price',
										variant: 'standard',
										onChange: function (M9) {
										  return SA(parseInt(M9.target.value))
										},
										value: SR,
										InputProps: {
										  startAdornment: Object(BG.jsx)(Bx.a, {
											position: 'start',
											children: Object(BG.jsx)('i', {
											  className: 'fas fa-dollar-sign',
											}),
										  }),
										},
									  }),
									}),
								  }),
								}),
								Object(BG.jsxs)('div', {
								  className: 'buttons',
								  children: [
									Object(BG.jsx)('div', {
									  children: Object(BG.jsx)(Bk.a, {
										onClick: function () {
										  return SD(false)
										},
										size: 'small',
										color: 'warning',
										variant: 'contained',
										children: 'Cancel',
									  }),
									}),
									Object(BG.jsx)('div', {
									  children: Object(BG.jsx)(Bk.a, {
										onClick: function () {
										  M0(true)
										  M8(true)
										  console.log('sellStateId', Sd)
										  console.log('sellPrice', SR)
										  console.log('sellPlate', SC)
										  Ba('rd-ui:carActionSell', {
											car: { plate: SC },
											stateId: Sd,
											price: SR,
										  }).then(function (MB) {
											M0(false)
											M4(true)
											setTimeout(function () {
											  M4(false)
											  SD(false)
											  M8(false)
											}, 1000)
										  })
										},
										size: 'small',
										color: 'success',
										variant: 'contained',
										children: 'Submit',
									  }),
									}),
								  ],
								}),
							  ],
							}),
						  ],
						}),
					  }),
					  Sm && Sm.length > 0
						? Sm.map(function (M9, MB) {
							return Object(BG.jsx)(
							  ic,
							  {
								plate: M9.license_plate,
								model: M9.model,
								state: M9.vehicle_state,
								garage: M9.current_garage,
								engine: M9.engine_damage,
								body: M9.body_damage,
								type: M9.type,
								spawnable: M9.spawnable,
								location: M9.location,
								appearance: M9.appearance,
								mods: M9.mods,
								damage: M9.damage,
							  },
							  MB
							)
						  })
						: Object(BG.jsx)(BG.Fragment, {}),
					],
				  }),
				})
			  )
			}
		  },
		  iv = B2(247),
		  iP = B2(252),
		  iZ = B2(244),
		  iV = Object(i4.a)({
			documentsOuterContainer: {
			  width: '100%',
			  height: '100%',
			  overflow: 'hidden',
			  position: 'absolute',
			  bottom: '0%',
			  opacity: '1',
			},
			documentsInnerContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  position: 'absolute',
			  transition: 'all 400ms ease 0s',
			  willChange: 'left',
			},
			documentsSearch: {
			  width: '100%',
			  height: '64px',
			  display: 'flex',
			  padding: '8px 16px',
			  position: 'relative',
			  marginBottom: '8px',
			},
			documentsSearchWrapper: {
			  width: '100%',
			  position: 'relative',
			},
			documentsIcon: {
			  top: '32px',
			  right: '16px',
			  display: 'flex',
			  zIndex: '1',
			  position: 'absolute',
			  justifyContent: 'flex-end',
			},
			documentsIconWrapper: {
			  color: '#fff',
			  marginLeft: '16px',
			},
			documentsDocs: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  overflow: 'hidden scroll',
			  maxHeight: 'calc(100% - 72px)',
			  minHeight: 'calc(100% - 72px)',
			},
		  }),
		  im = function () {
			{
			  var Sc = iV()
			  return (
				Bi('closeApps', function () {}),
				Object(BG.jsx)(BG.Fragment, {
				  children: Object(BG.jsx)('div', {
					className: Sc.documentsOuterContainer,
					style: { zIndex: 500 },
					children: Object(BG.jsx)('div', {
					  className: Sc.documentsOuterContainer,
					  children: Object(BG.jsxs)('div', {
						className: 'documents-container',
						children: [
						  Object(BG.jsx)('div', {
							className: Sc.documentsSearch,
							children: Object(BG.jsx)('div', {
							  className: Sc.documentsSearchWrapper,
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Search',
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)(ia.a, {}),
									  }),
									},
									variant: 'standard',
								  }),
								}),
							  }),
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: Sc.documentsIcon,
							children: Object(BG.jsx)('div', {
							  className: Sc.documentsIconWrapper,
							  children: Object(BG.jsx)(Bg.a, {
								title: 'Create Document',
								placement: 'left',
								sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
								arrow: true,
								children: Object(BG.jsx)('i', {
								  style: { fontSize: '1.2em' },
								  className: 'fas fa-edit fa-w-16 fa-fw fa-lg',
								}),
							  }),
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: Sc.documentsSearch,
							style: {
							  paddingTop: '0px',
							  paddingBottom: '0px',
							  marginBottom: '0px',
							},
							children: Object(BG.jsxs)(Bw.a, {
							  variant: 'standard',
							  sx: { width: '100%' },
							  children: [
								Object(BG.jsx)(iv.a, {
								  id: 'demo-simple-select-label',
								  children: 'Type',
								}),
								Object(BG.jsxs)(iZ.a, {
								  labelId: 'demo-simple-select-label',
								  id: 'demo-simple-select',
								  label: 'Type',
								  defaultValue: 'notes',
								  children: [
									Object(BG.jsx)(iP.a, {
									  value: 'notes',
									  children: 'Notes',
									}),
									Object(BG.jsx)(iP.a, {
									  value: 'licenses',
									  children: 'Licenses',
									}),
									Object(BG.jsx)(iP.a, {
									  value: 'documents',
									  children: 'Documents',
									}),
									Object(BG.jsx)(iP.a, {
									  value: 'vehicleregistration',
									  children: 'Vehicle Registration',
									}),
									Object(BG.jsx)(iP.a, {
									  value: 'housingdocuments',
									  children: 'Housing Documents',
									}),
									Object(BG.jsx)(iP.a, {
									  value: 'contracts',
									  children: 'Contracts',
									}),
								  ],
								}),
							  ],
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: Sc.documentsDocs,
							children: Object(BG.jsx)('div', {
							  className: 'component-paper cursor-pointer',
							  style: { paddingBottom: '0.5%' },
							  children: Object(BG.jsxs)('div', {
								className: 'main-container',
								children: [
								  Object(BG.jsx)('div', {
									className: 'details',
									children: Object(BG.jsx)('div', {
									  className: 'title',
									  children: Object(BG.jsx)(BO.a, {
										style: {
										  color: '#fff',
										  wordBreak: 'break-word',
										},
										variant: 'body2',
										gutterBottom: true,
										children: 'Test Document',
									  }),
									}),
								  }),
								  Object(BG.jsx)('div', {
									className: 'image',
									style: {
									  marginRight: '0px',
									  marginTop: '0px',
									},
									children: Object(BG.jsx)('i', {
									  className:
										'fas fa-edit fa-w-16 fa-fw fa-1x',
									}),
								  }),
								],
							  }),
							}),
						  }),
						],
					  }),
					}),
				  }),
				})
			  )
			}
		  },
		  iY = B2(241),
		  iz = B2(261),
		  iF = Object(i4.a)({
			housingOuterContainer: {
			  width: '100%',
			  height: '100%',
			  overflow: 'hidden',
			  position: 'absolute',
			  bottom: '0%',
			  opacity: '1',
			},
			housingInnerContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  position: 'absolute',
			  transition: 'all 400ms ease 0s',
			  willChange: 'left',
			},
			housingSearch: {
			  width: '100%',
			  height: '64px',
			  display: 'flex',
			  padding: '8px 16px',
			  position: 'relative',
			  marginBottom: '8px',
			},
			housingSearchWrapper: {
			  width: '100%',
			  position: 'relative',
			},
			housingIcon: {
			  top: '32px',
			  right: '16px',
			  display: 'flex',
			  zIndex: '1',
			  position: 'absolute',
			  justifyContent: 'flex-end',
			},
			housingIconWrapper: {
			  color: '#fff',
			  marginLeft: '16px',
			},
			housingHouses: {
			  width: '20%',
			  padding: '0px 16px',
			  overflow: 'hidden scroll',
			  maxHeight: 'calc(100% - 72px)',
			  minHeight: 'calc(100% - 72px)',
			},
			housingUpgrades: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  overflow: 'hidden scroll',
			  maxHeight: 'calc(100% - 72px)',
			},
			housingButtons: {
			  width: '100%',
			  height: '45px',
			  display: 'flex',
			  paddingTop: '0px',
			  paddingBottom: '15px',
			  justifyContent: 'center',
			},
			housingNothingFoundModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			housingNothingFoundModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
			housingFoundModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			housingFoundModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
			housingKeysModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			housingKeysModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  flexDirection: 'column',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
		  }),
		  iX = function (Sw) {
			return Object(BG.jsx)(BG.Fragment, {
			  children: Object(BG.jsx)(Bw.a, {
				fullWidth: true,
				sx: { width: '100%' },
				children: Object(BG.jsx)(Bc.a, {
				  id: 'outlined-select-currency',
				  variant: 'standard',
				  select: true,
				  label: Sw.label,
				  value: Sw.value,
				  onChange: function (Sk) {
					return Sw.onChange(Sk.target.value)
				  },
				  sx: {
					'& .MuiInput-root': { color: 'white !important' },
					'& label.Mui-focused': { color: 'darkgray !important' },
					'& Mui-focused': { color: 'darkgray !important' },
					'& .MuiInput-underline:hover:not(.Mui-disabled):before': {
					  borderColor: 'darkgray !important',
					},
					'& .MuiInput-underline:before': {
					  borderColor: 'darkgray !important',
					  color: 'darkgray !important',
					},
					'& .MuiInput-underline:after': {
					  borderColor: 'white !important',
					  color: 'darkgray !important',
					},
					'& .Mui-focused:after': { color: 'darkgray !important' },
					'& .MuiInputAdornment-root': { color: 'darkgray !important' },
				  },
				  children:
					Sw.items && Sw.items.length > 0
					  ? Sw.items.map(function (Sk) {
						  return Object(BG.jsx)(
							iP.a,
							{
							  value: Sk.id,
							  children: Sk.name,
							},
							Sk.id
						  )
						})
					  : Object(BG.jsx)(BG.Fragment, {}),
				}),
			  }),
			})
		  },
		  iD = function () {
			{
			  var Sc = iF(),
				Sx = Object(BP.c)(BZ),
				Sk = Object(B9.a)(Sx, 2),
				Sv = Sk[0],
				SP = Sk[1],
				SZ = Object(B4.useState)(false),
				SV = Object(B9.a)(SZ, 2),
				Sm = SV[0],
				SY = SV[1],
				Sz = Object(B4.useState)(false),
				SF = Object(B9.a)(Sz, 2),
				SX = SF[0],
				SD = SF[1],
				Sr = Object(B4.useState)(false),
				Sl = Object(B9.a)(Sr, 2),
				Sd = Sl[0],
				Sj = Sl[1],
				SH = Object(B4.useState)(0),
				SI = Object(B9.a)(SH, 2),
				SR = SI[0],
				SA = SI[1],
				SL = Object(B4.useState)(''),
				SJ = Object(B9.a)(SL, 2),
				SC = SJ[0],
				SE = SJ[1],
				SU = Object(B4.useState)([]),
				SW = Object(B9.a)(SU, 2),
				M0 = SW[0],
				M1 = SW[1],
				M2 = Object(B4.useState)([]),
				M3 = Object(B9.a)(M2, 2),
				M4 = M3[0],
				M5 = M3[1],
				M6 = Object(B4.useState)([]),
				M7 = Object(B9.a)(M6, 2),
				M8 = M7[0],
				M9 = M7[1],
				MB = Object(B4.useState)(false),
				Mi = Object(B9.a)(MB, 2),
				MS = Mi[0],
				MM = Mi[1],
				Mp = Object(B4.useState)(false),
				Ma = Object(B9.a)(Mp, 2),
				Ms = Ma[0],
				Mo = Ma[1],
				MQ = Object(B4.useState)(false),
				MO = Object(B9.a)(MQ, 2),
				Mn = MO[0],
				MK = MO[1],
				Mb = Object(B4.useState)(''),
				Mg = Object(B9.a)(Mb, 2),
				MT = Mg[0],
				MN = Mg[1],
				MG = Object(B4.useState)(''),
				My = Object(B9.a)(MG, 2),
				Mu = My[0],
				Mf = My[1],
				Mh = Object(B4.useState)(0),
				Mq = Object(B9.a)(Mh, 2),
				Mw = Mq[0],
				Mc = Mq[1],
				Mx = Object(B4.useState)(false),
				Mk = Object(B9.a)(Mx, 2),
				Mv = Mk[0],
				MP = Mk[1],
				MZ = Object(B4.useState)(false),
				MV = Object(B9.a)(MZ, 2),
				Mm = MV[0],
				MY = MV[1],
				Mz = Object(B4.useState)(''),
				MF = Object(B9.a)(Mz, 2),
				MX = MF[0],
				MD = MF[1],
				Mr = Object(BP.c)(Bj),
				Ml = Object(B9.a)(Mr, 2),
				Md = Ml[0],
				Mj = Ml[1],
				MH = Object(BP.c)(BH),
				MI = Object(B9.a)(MH, 2),
				MR = MI[0],
				MA = MI[1]
			  Object(B4.useEffect)(function () {
				Ba('getHousingData', {}).then(function (p5) {
				  M1(p5.owned)
				  M5(p5.access)
				  M9(p5.available)
				  SA(p5.roomNumber)
				  SE(p5.roomType)
				})
			  }, [])
			  var ML = B5.a.useState(0),
				MJ = Object(B9.a)(ML, 2),
				MC = MJ[0],
				ME = MJ[1],
				MU = function (p3) {
				  SP(p3.currentTarget.id)
				},
				MW = function () {
				  SP('')
				},
				p0 = function (p3, p4) {
				  Ba('manageHousingLocks', {
					id: p3.currentTarget.id,
					action: p4,
				  }).then(function (p6) {
					M1([])
					M5([])
					M1(p6.owned)
					M5(p6.access)
				  })
				},
				p1 = function (p3) {
				  Ba('setHousingGps', { id: p3.currentTarget.id })
				},
				p2 = function (p3, p4) {
				  console.log('handleEditMode')
				  SD(false)
				  MY(false)
				  MD('')
				  MM(true)
				  SY(true)
				  Sj(true)
				  setTimeout(function () {
					p3
					  ? Ba('enterEditMode', { id: p4 }).then(function (p7) {
						  console.log('enterEditMode', p7)
						  true === p7.meta.ok
							? (MM(false),
							  SY(false),
							  Sj(false),
							  Mj(true),
							  MA(p7.data))
							: (SY(false),
							  Sj(false),
							  MD(p7.meta.message),
							  MY(true),
							  MA({}))
						})
					  : Ba('exitEditMode', { id: p4 }).then(function (p7) {
						  console.log('exitEditMode', p7)
						  true === p7.meta.ok
							? (MM(false), SY(false), Sj(false), Mj(false), MA({}))
							: (SY(false),
							  Sj(false),
							  MD(p7.meta.message),
							  MY(true),
							  MA({}))
						})
				  }, 500)
				}
			  return (
				Bi('closeApps', function () {
				  Mo(false)
				  MM(false)
				  MP(false)
				  MK(false)
				  SY(false)
				  Sj(false)
				  SD(false)
				  MY(false)
				  MD('')
				}),
				Object(BG.jsxs)(BG.Fragment, {
				  children: [
					Object(BG.jsx)('div', {
					  className: Sc.housingFoundModalContainer,
					  style: { display: MS ? '' : 'none' },
					  children: Object(BG.jsxs)('div', {
						className: Sc.housingFoundModalInnerContainer,
						children: [
						  Object(BG.jsx)('div', {
							className: 'spinner-wrapper',
							style: { display: Sm ? '' : 'none' },
							children: Object(BG.jsxs)('div', {
							  className: 'lds-spinner',
							  children: [
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
							  ],
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'spinner-wrapper',
							style: { display: SX ? '' : 'none' },
							children: Object(BG.jsx)(Bv.Checkmark, {
							  size: '56px',
							  color: '#009688',
							}),
						  }),
						  Object(BG.jsxs)('div', {
							className: 'component-simple-form',
							style: { display: Sm || Sd ? 'none' : '' },
							children: [
							  Object(BG.jsx)('div', {
								style: {
								  justifyContent: 'center',
								  marginBottom: '10px',
								  display: Mm ? '' : 'none',
								},
								children: Object(BG.jsx)('i', {
								  className: 'fas fa-exclamation fa-2x',
								  style: { color: '#ffa726' },
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: {
								  justifyContent: 'center',
								  display: Mm ? '' : 'none',
								},
								children: Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
								  },
								  variant: 'body2',
								  gutterBottom: true,
								  children: MX,
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: { justifyContent: 'center' },
								children: Object(BG.jsxs)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
									display: Mm ? 'none' : '',
								  },
								  variant: 'body2',
								  children: ['Name: ', MT],
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: { justifyContent: 'center' },
								children: Object(BG.jsxs)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
									display: Mm ? 'none' : '',
								  },
								  variant: 'body2',
								  children: ['Category: ', Mu],
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: { justifyContent: 'center' },
								children: Object(BG.jsxs)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
									display: Mm ? 'none' : '',
								  },
								  variant: 'body2',
								  children: [
									'Price: ',
									Mw.toLocaleString('en-Us', {
									  style: 'currency',
									  currency: 'USD',
									}),
								  ],
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: { justifyContent: 'center' },
								children: Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
									display: Mv ? '' : 'none',
								  },
								  variant: 'body2',
								  children: 'Already Owned',
								}),
							  }),
							  Object(BG.jsxs)('div', {
								className: 'buttons',
								style: {
								  justifyContent: Mm || Mv ? 'center' : '',
								},
								children: [
								  Object(BG.jsx)('div', {
									children: Object(BG.jsx)(Bk.a, {
									  onClick: function () {
										MM(false)
										MY(false)
									  },
									  size: 'small',
									  color: Mm ? 'success' : 'warning',
									  variant: 'contained',
									  children: Mm ? 'Okay' : 'Cancel',
									}),
								  }),
								  Object(BG.jsx)('div', {
									style: { display: Mm || Mv ? 'none' : '' },
									children: Object(BG.jsx)(Bk.a, {
									  onClick: function () {
										SY(true)
										Sj(true)
										Ba('purchaseHousing', {}).then(function (
										  p4
										) {
										  true === p4.success
											? (M1(p4.owned),
											  setTimeout(function () {
												SY(false)
												SD(true)
												setTimeout(function () {
												  SD(false)
												  MM(false)
												  Sj(false)
												}, 1500)
											  }, 500))
											: (SY(false),
											  Sj(false),
											  MD(p4.owned),
											  MY(true))
										})
									  },
									  size: 'small',
									  color: 'success',
									  variant: 'contained',
									  children: 'Purchase',
									}),
								  }),
								],
							  }),
							],
						  }),
						],
					  }),
					}),
					Object(BG.jsx)('div', {
					  className: Sc.housingNothingFoundModalContainer,
					  style: { display: Ms ? '' : 'none' },
					  children: Object(BG.jsxs)('div', {
						className: Sc.housingNothingFoundModalInnerContainer,
						children: [
						  Object(BG.jsx)('div', {
							className: 'spinner-wrapper',
							style: { display: Sm ? '' : 'none' },
							children: Object(BG.jsxs)('div', {
							  className: 'lds-spinner',
							  children: [
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
							  ],
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'spinner-wrapper',
							style: { display: SX ? '' : 'none' },
							children: Object(BG.jsx)(Bv.Checkmark, {
							  size: '56px',
							  color: '#009688',
							}),
						  }),
						  Object(BG.jsxs)('div', {
							className: 'component-simple-form',
							style: { display: Sd ? 'none' : '' },
							children: [
							  Object(BG.jsx)('div', {
								style: {
								  justifyContent: 'center',
								  marginBottom: '10px',
								},
								children: Object(BG.jsx)('i', {
								  className: 'fas fa-exclamation fa-2x',
								  style: { color: '#ffa726' },
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: { justifyContent: 'center' },
								children: Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
								  },
								  variant: 'body2',
								  gutterBottom: true,
								  children: 'No property found',
								}),
							  }),
							  Object(BG.jsx)('div', {
								className: 'buttons',
								style: { justifyContent: 'center' },
								children: Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  Mo(false)
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Okay',
								  }),
								}),
							  }),
							],
						  }),
						],
					  }),
					}),
					Object(BG.jsx)('div', {
					  className: Sc.housingKeysModalContainer,
					  style: { display: Mn ? '' : 'none' },
					  children: Object(BG.jsxs)('div', {
						className: Sc.housingKeysModalInnerContainer,
						children: [
						  Object(BG.jsx)('div', {
							className: 'spinner-wrapper',
							style: { display: Sm ? '' : 'none' },
							children: Object(BG.jsxs)('div', {
							  className: 'lds-spinner',
							  children: [
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
							  ],
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'spinner-wrapper',
							style: { display: SX ? '' : 'none' },
							children: Object(BG.jsx)(Bv.Checkmark, {
							  size: '56px',
							  color: '#009688',
							}),
						  }),
						  Object(BG.jsxs)('div', {
							className: 'component-simple-form',
							style: { display: Sm || Sd ? 'none' : '' },
							children: [
							  Object(BG.jsx)('div', {
								style: {
								  justifyContent: 'center',
								  marginBottom: '10px',
								  display: Mm ? '' : 'none',
								},
								children: Object(BG.jsx)('i', {
								  className: 'fas fa-exclamation fa-2x',
								  style: { color: '#ffa726' },
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: {
								  justifyContent: 'center',
								  display: Mm ? '' : 'none',
								},
								children: Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
								  },
								  variant: 'body2',
								  gutterBottom: true,
								  children: MX,
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: { display: Mm ? 'none' : '' },
								children: Object(BG.jsxs)('div', {
								  className: 'input-wrapper',
								  children: [
									Object(BG.jsx)(BO.a, {
									  style: {
										color: '#fff',
										wordBreak: 'break-word',
									  },
									  variant: 'body1',
									  gutterBottom: true,
									  children: 'Add:',
									}),
									Object(BG.jsx)(Bw.a, {
									  fullWidth: true,
									  sx: { width: '100%' },
									  children: Object(BG.jsx)(Bc.a, {
										id: 'input-with-icon-textfield',
										label: 'State ID',
										variant: 'standard',
										InputProps: {
										  startAdornment: Object(BG.jsx)(Bx.a, {
											position: 'start',
											children: Object(BG.jsx)('i', {
											  className: 'fas fa-id-card',
											}),
										  }),
										},
									  }),
									}),
								  ],
								}),
							  }),
							  Object(BG.jsxs)('div', {
								className: 'buttons',
								style: { justifyContent: Mm ? 'center' : '' },
								children: [
								  Object(BG.jsx)('div', {
									children: Object(BG.jsx)(Bk.a, {
									  onClick: function () {
										return MK(false)
									  },
									  size: 'small',
									  color: 'warning',
									  variant: 'contained',
									  children: Mm ? 'Close' : 'Cancel',
									}),
								  }),
								  Object(BG.jsx)('div', {
									style: { display: Mm ? 'none' : '' },
									children: Object(BG.jsx)(Bk.a, {
									  onClick: function () {
										return MK(false)
									  },
									  size: 'small',
									  color: 'success',
									  variant: 'contained',
									  children: 'Submit',
									}),
								  }),
								],
							  }),
							],
						  }),
						  Object(BG.jsxs)('div', {
							className: 'component-simple-form',
							style: { display: Sm || Sd ? 'none' : '' },
							children: [
							  Object(BG.jsx)(ig.a, {
								variant: 'fullWidth',
								sx: {
								  borderColor: 'rgba(255, 255, 255, 255)',
								  paddingTop: '5%',
								  paddingBottom: '5%',
								},
							  }),
							  Object(BG.jsx)('div', {
								style: {
								  justifyContent: 'center',
								  marginBottom: '10px',
								  display: Mm ? '' : 'none',
								},
								children: Object(BG.jsx)('i', {
								  className: 'fas fa-exclamation fa-2x',
								  style: { color: '#ffa726' },
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: {
								  justifyContent: 'center',
								  display: Mm ? '' : 'none',
								},
								children: Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
								  },
								  variant: 'body2',
								  gutterBottom: true,
								  children: MX,
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: { display: Mm ? 'none' : '' },
								children: Object(BG.jsx)('div', {
								  className: 'input-wrapper',
								  children: Object(BG.jsx)(iX, {
									label: 'Remove',
									value: '',
									onChange: function (p3) {},
									items: [
									  {
										id: '1',
										name: 'Kevin Malagnaggi',
									  },
									],
								  }),
								}),
							  }),
							  Object(BG.jsxs)('div', {
								className: 'buttons',
								style: { justifyContent: Mm ? 'center' : '' },
								children: [
								  Object(BG.jsx)('div', {
									children: Object(BG.jsx)(Bk.a, {
									  onClick: function () {
										return MK(false)
									  },
									  size: 'small',
									  color: 'warning',
									  variant: 'contained',
									  children: Mm ? 'Close' : 'Cancel',
									}),
								  }),
								  Object(BG.jsx)('div', {
									style: { display: Mm ? 'none' : '' },
									children: Object(BG.jsx)(Bk.a, {
									  onClick: function () {
										return MK(false)
									  },
									  size: 'small',
									  color: 'success',
									  variant: 'contained',
									  children: 'Submit',
									}),
								  }),
								],
							  }),
							],
						  }),
						],
					  }),
					}),
					Object(BG.jsx)('div', {
					  className: Sc.housingOuterContainer,
					  style: { zIndex: 500 },
					  children: Object(BG.jsx)('div', {
						className: Sc.housingInnerContainer,
						children: Object(BG.jsxs)('div', {
						  className: 'housing-container',
						  children: [
							Object(BG.jsx)('div', {
							  className: Sc.housingSearch,
							  children: Object(BG.jsx)('div', {
								className: Sc.housingSearchWrapper,
								children: Object(BG.jsxs)(iY.a, {
								  centered: true,
								  variant: 'fullWidth',
								  value: MC,
								  onChange: function (p3, p4) {
									ME(p4)
								  },
								  'aria-label': 'icon tabs example',
								  children: [
									Object(BG.jsx)(iz.a, {
									  icon: Object(BG.jsx)('i', {
										className: 'fas fa-house-user fa-lg',
									  }),
									  'aria-label': 'apartments',
									}),
									Object(BG.jsx)(iz.a, {
									  icon: Object(BG.jsx)('i', {
										className: 'fas fa-building fa-lg',
									  }),
									  'aria-label': 'properties',
									}),
								  ],
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  className: Sc.housingIcon,
							  children: Object(BG.jsx)('div', {
								className: Sc.housingIconWrapper,
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: Sc.housingUpgrades,
							  style: {
								height: '17.4%',
								display: 0 === MC ? '' : 'none',
							  },
							  children: [
								Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
								  },
								  variant: 'body1',
								  gutterBottom: true,
								  children: 'Current',
								}),
								Object(BG.jsx)('div', {
								  className: 'component-paper cursor-pointer',
								  children: Object(BG.jsxs)('div', {
									className: 'main-container',
									children: [
									  Object(BG.jsx)('div', {
										className: 'image',
										children: Object(BG.jsx)('i', {
										  className:
											'fas fa-house-user fa-w-16 fa-fw fa-3x',
										}),
									  }),
									  Object(BG.jsxs)('div', {
										className: 'details',
										children: [
										  Object(BG.jsx)('div', {
											className: 'title',
											children: Object(BG.jsxs)(BO.a, {
											  style: {
												color: '#fff',
												wordBreak: 'break-word',
											  },
											  variant: 'body2',
											  gutterBottom: true,
											  children: ['Room: ', SR],
											}),
										  }),
										  Object(BG.jsx)('div', {
											className: 'description',
											children: Object(BG.jsx)('div', {
											  className: 'flex-row',
											  children: Object(BG.jsx)(BO.a, {
												style: {
												  color: '#fff',
												  wordBreak: 'break-word',
												},
												variant: 'body2',
												gutterBottom: true,
												children: SC,
											  }),
											}),
										  }),
										],
									  }),
									  Object(BG.jsx)('div', {
										className: 'actions',
									  }),
									],
								  }),
								}),
							  ],
							}),
							Object(BG.jsxs)('div', {
							  className: Sc.housingUpgrades,
							  style: { display: 0 === MC ? '' : 'none' },
							  children: [
								Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
								  },
								  variant: 'body1',
								  gutterBottom: true,
								  children: 'Available',
								}),
								M8.length &&
								  M8.map(function (p3) {
									return Object(BG.jsx)('div', {
									  id: p3.id,
									  className: 'component-paper cursor-pointer',
									  onMouseEnter: MU,
									  onMouseLeave: MW,
									  children: Object(BG.jsxs)('div', {
										className: 'main-container',
										children: [
										  Object(BG.jsx)('div', {
											className: 'image',
											children: Object(BG.jsx)('i', {
											  className:
												'fas fa-home fa-w-16 fa-fw fa-3x',
											}),
										  }),
										  Object(BG.jsxs)('div', {
											className: 'details',
											children: [
											  Object(BG.jsx)('div', {
												className: 'title',
												children: Object(BG.jsx)(BO.a, {
												  style: {
													color: '#fff',
													wordBreak: 'break-word',
												  },
												  variant: 'body2',
												  gutterBottom: true,
												  children:
													p3.price.toLocaleString(
													  'en-Us',
													  {
														style: 'currency',
														currency: 'USD',
													  }
													),
												}),
											  }),
											  Object(BG.jsx)('div', {
												className: 'description',
												children: Object(BG.jsx)('div', {
												  className: 'flex-row',
												  children: Object(BG.jsx)(BO.a, {
													style: {
													  color: '#fff',
													  wordBreak: 'break-word',
													},
													variant: 'body2',
													gutterBottom: true,
													children: p3.name,
												  }),
												}),
											  }),
											],
										  }),
										  Object(BG.jsx)('div', {
											className:
											  Sv.toString() === p3.id.toString()
												? 'actions actions-show'
												: 'actions',
											children: Object(BG.jsx)(Bg.a, {
											  title: 'Upgrade',
											  placement: 'top',
											  sx: {
												backgroundColor:
												  'rgba(97, 97, 97, 0.9)',
											  },
											  arrow: true,
											  children: Object(BG.jsx)('div', {
												children: Object(BG.jsx)('i', {
												  id: p3.id,
												  className:
													'fas fa-dollar-sign fa-w-16 fa-fw fa-lg',
												}),
											  }),
											}),
										  }),
										],
									  }),
									})
								  }),
							  ],
							}),
							Object(BG.jsxs)('div', {
							  className: Sc.housingButtons,
							  style: { display: 1 === MC ? '' : 'none' },
							  children: [
								Object(BG.jsx)(Bk.a, {
								  onClick: function () {
									Ba('checkLocation', {}).then(function (p3) {
									  true === p3.foundHouse
										? (console.log(
											'isOwned',
											p3.foundHouseIsOwned
										  ),
										  MM(true),
										  MN(p3.foundHouseName),
										  Mf(p3.foundHouseCategory),
										  Mc(p3.foundHousePrice),
										  MP(p3.foundHouseIsOwned),
										  SY(true),
										  setTimeout(function () {
											SY(false)
										  }, 500))
										: Mo(true)
									})
								  },
								  style: { display: Md ? 'none' : '' },
								  size: 'small',
								  color: 'success',
								  variant: 'contained',
								  children: 'View Current Location',
								}),
								Object(BG.jsx)(Bk.a, {
								  onClick: function () {
									return p2(false)
								  },
								  style: { display: Md ? '' : 'none' },
								  size: 'small',
								  color: 'success',
								  variant: 'contained',
								  children: 'Leave Edit Mode',
								}),
							  ],
							}),
							Object(BG.jsx)('div', {
							  style: {
								display: 1 === MC && Md ? '' : 'none',
								width: '100%',
								marginBottom: '1vh',
							  },
							  children: Object(BG.jsx)(ig.a, {
								variant: 'middle',
								sx: { borderColor: 'rgba(255, 255, 255, 255)' },
							  }),
							}),
							Object(BG.jsxs)('div', {
							  style: {
								display: 1 === MC && Md ? 'flex' : 'none',
								width: '100%',
								flexDirection: 'column',
							  },
							  children: [
								Object(BG.jsx)('div', {
								  style: {
									display: MR.garage ? 'flex' : 'none',
									justifyContent: 'center',
									marginBottom: '1vh',
								  },
								  children: Object(BG.jsx)(Bk.a, {
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Place Garage Here',
								  }),
								}),
								Object(BG.jsx)('div', {
								  style: {
									display: MR.stash ? 'flex' : 'none',
									justifyContent: 'center',
									marginBottom: '1vh',
								  },
								  children: Object(BG.jsx)(Bk.a, {
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Place Stash Here',
								  }),
								}),
								Object(BG.jsx)('div', {
								  style: {
									display: MR.backdoor ? 'flex' : 'none',
									justifyContent: 'center',
									marginBottom: '1vh',
								  },
								  children: Object(BG.jsx)(Bk.a, {
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Place Backdoor Here',
								  }),
								}),
								Object(BG.jsx)('div', {
								  style: {
									display: MR.wardrobe ? 'flex' : 'none',
									justifyContent: 'center',
									marginBottom: '1vh',
								  },
								  children: Object(BG.jsx)(Bk.a, {
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Place Wardrobe Here',
								  }),
								}),
								Object(BG.jsx)('div', {
								  style: {
									display: MR.furniture ? 'flex' : 'none',
									justifyContent: 'center',
									marginBottom: '1vh',
								  },
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
										return p2('furniture')
									  },
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Open Furniture',
								  }),
								}),
							  ],
							}),
							Object(BG.jsxs)('div', {
							  className: Sc.housingUpgrades,
							  style: {
								height: 'fit-content',
								display: 1 !== MC || Md ? 'none' : '',
							  },
							  onMouseEnter: MU,
							  onMouseLeave: MW,
							  children: [
								Object(BG.jsx)('div', {
								  style: {
									display: 'flex',
									justifyContent: 'center',
								  },
								  children: Object(BG.jsx)(Bk.a, {
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: Object(BG.jsx)('i', {
									  className: 'fas fa-edit',
									  style: { color: '#000' },
									}),
								  }),
								}),
								Object(BG.jsx)(BO.a, {
								  style: {
									display: M0.length > 0 && !Md ? '' : 'none',
									color: '#fff',
									wordBreak: 'break-word',
									marginTop: '5px',
								  },
								  variant: 'body1',
								  gutterBottom: true,
								  children: 'Owned',
								}),
								M0 && M0.length > 0 && !Md
								  ? M0.map(function (p3) {
									  return Object(BG.jsx)('div', {
										id: p3.property_id,
										className:
										  'component-paper cursor-pointer',
										onMouseEnter: MU,
										onMouseLeave: MW,
										children: Object(BG.jsxs)('div', {
										  className: 'main-container',
										  children: [
											Object(BG.jsx)('div', {
											  className: 'image',
											  children: Object(BG.jsx)('i', {
												className: 'fas '.concat(
												  'warehouse' === p3.category
													? 'fa-warehouse'
													: 'fa-home',
												  ' fa-w-16 fa-fw fa-3x'
												),
											  }),
											}),
											Object(BG.jsxs)('div', {
											  className: 'details',
											  children: [
												Object(BG.jsx)('div', {
												  className: 'title',
												  children: Object(BG.jsx)(BO.a, {
													style: {
													  color: '#fff',
													  wordBreak: 'break-word',
													},
													variant: 'body2',
													gutterBottom: true,
													children: p3.propertyname,
												  }),
												}),
												Object(BG.jsx)('div', {
												  className: 'description',
												  children: Object(BG.jsx)(
													'div',
													{
													  className: 'flex-row',
													  children: Object(BG.jsx)(
														BO.a,
														{
														  style: {
															color: '#fff',
															wordBreak:
															  'break-word',
														  },
														  variant: 'body2',
														  gutterBottom: true,
														  children:
															'warehouse' ===
															p3.category
															  ? 'warehouse'
															  : 'housing',
														}
													  ),
													}
												  ),
												}),
											  ],
											}),
											Object(BG.jsxs)('div', {
											  className:
												Sv.toString() ===
												p3.property_id.toString()
												  ? 'actions actions-show'
												  : 'actions',
											  children: [
												Object(BG.jsx)(Bg.a, {
												  title: 'Set GPS',
												  placement: 'top',
												  sx: {
													backgroundColor:
													  'rgba(97, 97, 97, 0.9)',
												  },
												  arrow: true,
												  children: Object(BG.jsx)(
													'div',
													{
													  children: Object(BG.jsx)(
														'i',
														{
														  id: p3.property_id,
														  onClick: function (p5) {
															return p1(p5)
														  },
														  className:
															'fas fa-map-marked fa-w-16 fa-fw fa-lg',
														}
													  ),
													}
												  ),
												}),
												Object(BG.jsx)(Bg.a, {
												  title: p3.locked
													? 'Unlock'
													: 'Lock',
												  placement: 'top',
												  sx: {
													backgroundColor:
													  'rgba(97, 97, 97, 0.9)',
												  },
												  arrow: true,
												  children: Object(BG.jsx)(
													'div',
													{
													  children: Object(BG.jsx)(
														'i',
														{
														  id: p3.property_id,
														  onClick: function (p5) {
															return p0(
															  p5,
															  p3.locked
																? 'unlock'
																: 'lock'
															)
														  },
														  className:
															'fas '.concat(
															  p3.locked
																? 'fa-lock'
																: 'fa-lock-open',
															  ' fa-w-16 fa-fw fa-lg'
															),
														}
													  ),
													}
												  ),
												}),
												Object(BG.jsx)(Bg.a, {
												  title: 'Edit Property',
												  placement: 'top',
												  sx: {
													backgroundColor:
													  'rgba(97, 97, 97, 0.9)',
												  },
												  arrow: true,
												  children: Object(BG.jsx)(
													'div',
													{
													  children: Object(BG.jsx)(
														'i',
														{
														  onClick: function () {
															return p2(
															  true,
															  p3.property_id
															)
														  },
														  className:
															'fas fa-edit fa-w-16 fa-fw fa-lg',
														}
													  ),
													}
												  ),
												}),
												Object(BG.jsx)(Bg.a, {
												  title: 'Keys',
												  placement: 'top',
												  sx: {
													backgroundColor:
													  'rgba(97, 97, 97, 0.9)',
												  },
												  arrow: true,
												  children: Object(BG.jsx)(
													'div',
													{
													  children: Object(BG.jsx)(
														'i',
														{
														  onClick: function () {
															return MK(true)
														  },
														  className:
															'fas fa-key fa-w-16 fa-fw fa-lg',
														}
													  ),
													}
												  ),
												}),
											  ],
											}),
										  ],
										}),
									  })
									})
								  : Object(BG.jsx)(BG.Fragment, {}),
							  ],
							}),
							Object(BG.jsxs)('div', {
							  className: Sc.housingUpgrades,
							  style: { display: 1 === MC ? '' : 'none' },
							  children: [
								Object(BG.jsx)('div', {
								  style: { marginTop: '5px' },
								  children: Object(BG.jsx)(BO.a, {
									style: {
									  display: M4.length > 0 && !Md ? '' : 'none',
									  color: '#fff',
									  wordBreak: 'break-word',
									},
									variant: 'body1',
									gutterBottom: true,
									children: 'Access',
								  }),
								}),
								M4 && M4.length > 0 && !Md
								  ? M4.map(function (p3) {
									  return Object(BG.jsx)('div', {
										id: p3.property_id,
										className:
										  'component-paper cursor-pointer',
										onMouseEnter: MU,
										onMouseLeave: MW,
										children: Object(BG.jsxs)('div', {
										  className: 'main-container',
										  children: [
											Object(BG.jsx)('div', {
											  className: 'image',
											  children: Object(BG.jsx)('i', {
												className: 'fas '.concat(
												  'warehouse' === p3.category
													? 'fa-warehouse'
													: 'fa-home',
												  ' fa-w-16 fa-fw fa-3x'
												),
											  }),
											}),
											Object(BG.jsxs)('div', {
											  className: 'details',
											  children: [
												Object(BG.jsx)('div', {
												  className: 'title',
												  children: Object(BG.jsx)(BO.a, {
													style: {
													  color: '#fff',
													  wordBreak: 'break-word',
													},
													variant: 'body2',
													gutterBottom: true,
													children: p3.propertyname,
												  }),
												}),
												Object(BG.jsx)('div', {
												  className: 'description',
												  children: Object(BG.jsx)(
													'div',
													{
													  className: 'flex-row',
													  children: Object(BG.jsx)(
														BO.a,
														{
														  style: {
															color: '#fff',
															wordBreak:
															  'break-word',
														  },
														  variant: 'body2',
														  gutterBottom: true,
														  children:
															'warehouse' ===
															p3.category
															  ? 'warehouse'
															  : 'housing',
														}
													  ),
													}
												  ),
												}),
											  ],
											}),
											Object(BG.jsxs)('div', {
											  className:
												Sv.toString() ===
												p3.property_id.toString()
												  ? 'actions actions-show'
												  : 'actions',
											  children: [
												Object(BG.jsx)(Bg.a, {
												  title: 'Set GPS',
												  placement: 'top',
												  sx: {
													backgroundColor:
													  'rgba(97, 97, 97, 0.9)',
												  },
												  arrow: true,
												  children: Object(BG.jsx)(
													'div',
													{
													  children: Object(BG.jsx)(
														'i',
														{
														  id: p3.property_id,
														  onClick: function (p5) {
															return p1(p5)
														  },
														  className:
															'fas fa-map-marked fa-w-16 fa-fw fa-lg',
														}
													  ),
													}
												  ),
												}),
												Object(BG.jsx)(Bg.a, {
												  title: p3.locked
													? 'Unlock'
													: 'Lock',
												  placement: 'top',
												  sx: {
													backgroundColor:
													  'rgba(97, 97, 97, 0.9)',
												  },
												  arrow: true,
												  children: Object(BG.jsx)(
													'div',
													{
													  children: Object(BG.jsx)(
														'i',
														{
														  id: p3.property_id,
														  onClick: function (p5) {
															return p0(
															  p5,
															  p3.locked
																? 'unlock'
																: 'lock'
															)
														  },
														  className:
															'fas '.concat(
															  p3.locked
																? 'fa-lock'
																: 'fa-lock-open',
															  ' fa-w-16 fa-fw fa-lg'
															),
														}
													  ),
													}
												  ),
												}),
											  ],
											}),
										  ],
										}),
									  })
									})
								  : Object(BG.jsx)(BG.Fragment, {}),
							  ],
							}),
						  ],
						}),
					  }),
					}),
				  ],
				})
			  )
			}
		  },
		  ir = Object(i4.a)({
			root: {
			  top: '0px',
			  left: '0px',
			  width: '100vw',
			  height: '100vh',
			  position: 'absolute',
			  maxWidth: '100vw',
			  minWidth: '100vw',
			  maxHeight: '100vh',
			  minHeight: '100vh',
			  pointerEvents: 'none',
			  border: '0px',
			  margin: '0px',
			  outline: '0px',
			  padding: '0px',
			  overflow: 'hidden',
			  '& .MuiInput-root': {
				color: 'white',
				fontSize: '1.3vmin',
			  },
			  '& .MuiInput-underline:hover:not(.Mui-disabled):before': {
				borderColor: 'darkgray',
			  },
			  '& .MuiInput-underline:before': {
				borderColor: 'darkgray',
				color: 'darkgray',
			  },
			  '& .MuiInput-underline:after': {
				borderColor: 'white',
				color: 'darkgray',
			  },
			  '& .MuiInputLabel-animated': {
				color: 'darkgray',
				fontSize: '1.5vmin',
			  },
			  '& .MuiInputAdornment-root': { color: 'darkgray' },
			  '& label.Mui-focused': { color: 'darkgray' },
			},
			input: {
			  '& input[type=number]': { '-moz-appearance': 'textfield' },
			  '& input[type=number]::-webkit-outer-spin-button': {
				'-webkit-appearance': 'none',
				margin: 0,
			  },
			  '& input[type=number]::-webkit-inner-spin-button': {
				'-webkit-appearance': 'none',
				margin: 0,
			  },
			},
			cryptoPurchaseModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			cryptoPurchaseModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
			cryptoExchangeModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			cryptoExchangeModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
		  }),
		  il = function (Sw) {
			var Sx = Object(B4.useState)(false),
			  Sk = Object(B9.a)(Sx, 2),
			  Sv = Sk[0],
			  SP = Sk[1],
			  SZ = Object(BP.c)(BV),
			  SV = Object(B9.a)(SZ, 2),
			  Sm = (SV[0], SV[1]),
			  SY = Object(BP.c)(Bm),
			  Sz = Object(B9.a)(SY, 2),
			  SF = (Sz[0], Sz[1]),
			  SX = Object(BP.c)(BY),
			  SD = Object(B9.a)(SX, 2),
			  Sr = (SD[0], SD[1])
			return Object(BG.jsx)(BG.Fragment, {
			  children: Object(BG.jsxs)('div', {
				className: 'component-paper cursor-pointer',
				onClick: function () {
				  SP(!Sv)
				},
				children: [
				  Object(BG.jsxs)('div', {
					className: 'main-container',
					children: [
					  Object(BG.jsx)('div', {
						className: 'image',
						children: Object(BG.jsx)('i', {
						  className: ''.concat(Sw.icon, ' fa-w-16 fa-fw fa-3x'),
						}),
					  }),
					  Object(BG.jsxs)('div', {
						className: 'details',
						children: [
						  Object(BG.jsx)('div', {
							className: 'title',
							children: Object(BG.jsx)(BO.a, {
							  style: {
								color: '#fff',
								wordBreak: 'break-word',
							  },
							  variant: 'body2',
							  gutterBottom: true,
							  children: Sw.name,
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'description',
							children: Object(BG.jsx)('div', {
							  className: 'flex-row',
							  children: Object(BG.jsx)(BO.a, {
								style: {
								  color: '#fff',
								  wordBreak: 'break-word',
								},
								variant: 'body2',
								gutterBottom: true,
								children:
								  undefined === Sw.amount ? '0' : Sw.amount,
							  }),
							}),
						  }),
						],
					  }),
					  Object(BG.jsx)('div', { className: 'actions' }),
					],
				  }),
				  Object(BG.jsxs)(iw.a, {
					in: Sv,
					timeout: 'auto',
					unmountOnExit: true,
					children: [
					  Object(BG.jsx)(Bw.a, {
						sx: {
						  width: '85%',
						  marginLeft: '7.5%',
						  marginBottom: '1.5%',
						},
						children: Object(BG.jsx)(Bc.a, {
						  id: 'input-with-icon-textfield',
						  variant: 'standard',
						  value: ''.concat(Sw.tag, ' (').concat(Sw.id, ')'),
						  InputProps: {
							readOnly: true,
							startAdornment: Object(BG.jsx)(Bx.a, {
							  position: 'start',
							  children: Object(BG.jsx)('i', {
								className: 'fas fa-id-card',
							  }),
							}),
						  },
						}),
					  }),
					  Object(BG.jsx)(Bw.a, {
						sx: {
						  width: '85%',
						  marginLeft: '7.5%',
						  marginBottom: '1.5%',
						},
						children: Object(BG.jsx)(Bc.a, {
						  id: 'input-with-icon-textfield',
						  variant: 'standard',
						  value: Sw.name,
						  InputProps: {
							readOnly: true,
							startAdornment: Object(BG.jsx)(Bx.a, {
							  position: 'start',
							  children: Object(BG.jsx)('i', {
								className: 'fas fa-tag',
							  }),
							}),
						  },
						}),
					  }),
					  Object(BG.jsx)(Bw.a, {
						sx: {
						  width: '85%',
						  marginLeft: '7.5%',
						  marginBottom: '1.5%',
						},
						children: Object(BG.jsx)(Bc.a, {
						  id: 'input-with-icon-textfield',
						  variant: 'standard',
						  value: undefined === Sw.amount ? '0' : Sw.amount,
						  InputProps: {
							readOnly: true,
							startAdornment: Object(BG.jsx)(Bx.a, {
							  position: 'start',
							  children: Object(BG.jsx)('i', {
								className: 'fas fa-money-check-alt',
							  }),
							}),
						  },
						}),
					  }),
					  Object(BG.jsx)(Bw.a, {
						sx: {
						  width: '85%',
						  marginLeft: '7.5%',
						  marginBottom: '1.5%',
						},
						children: Object(BG.jsx)(Bc.a, {
						  id: 'input-with-icon-textfield',
						  variant: 'standard',
						  value: Sw.value.toLocaleString('en-Us', {
							style: 'currency',
							currency: 'USD',
						  }),
						  InputProps: {
							readOnly: true,
							startAdornment: Object(BG.jsx)(Bx.a, {
							  position: 'start',
							  children: Object(BG.jsx)('i', {
								className: 'fas fa-poll',
							  }),
							}),
						  },
						}),
					  }),
					  Object(BG.jsxs)(BW.a, {
						direction: 'row',
						sx: {
						  marginTop: '1%',
						  marginLeft: '7.5%',
						},
						children: [
						  Object(BG.jsx)(Bk.a, {
							onClick: function (Sl) {
							  Sl.stopPropagation()
							  Sr(Sw.id)
							  Sm(true)
							},
							style: {
							  display: Sw.buyable ? '' : 'none',
							  marginRight: '8.1%',
							},
							size: 'small',
							color: 'success',
							variant: 'contained',
							children: 'Purchase',
						  }),
						  Object(BG.jsx)(Bk.a, {
							onClick: function (Sl) {
							  Sl.stopPropagation()
							  Sr(Sw.id)
							  SF(true)
							},
							style: {
							  display: Sw.exchangeable ? '' : 'none',
							  marginRight: '8.1%',
							},
							size: 'small',
							color: 'warning',
							variant: 'contained',
							children: 'Exchange',
						  }),
						],
					  }),
					],
				  }),
				],
			  }),
			})
		  },
		  id = function () {
			{
			  var Sc = ir(),
				Sx = Object(B4.useState)([]),
				Sk = Object(B9.a)(Sx, 2),
				Sv = Sk[0],
				SP = Sk[1],
				SZ = Object(B4.useState)([]),
				SV = Object(B9.a)(SZ, 2),
				Sm = SV[0],
				SY = SV[1],
				Sz = Object(B4.useState)(''),
				SF = Object(B9.a)(Sz, 2),
				SX = SF[0],
				SD = SF[1],
				Sr = Object(B4.useState)(''),
				Sl = Object(B9.a)(Sr, 2),
				Sd = Sl[0],
				Sj = Sl[1],
				SH = Object(B4.useState)(''),
				SI = Object(B9.a)(SH, 2),
				SR = SI[0],
				SA = SI[1],
				SL = Object(BP.d)(BV),
				SJ = Object(BP.c)(BV),
				SC = Object(B9.a)(SJ, 2),
				SE = (SC[0], SC[1]),
				SU = Object(BP.d)(Bm),
				SW = Object(BP.c)(Bm),
				M0 = Object(B9.a)(SW, 2),
				M1 = (M0[0], M0[1]),
				M2 = Object(BP.d)(BY),
				M3 = Object(B4.useState)(false),
				M4 = Object(B9.a)(M3, 2),
				M5 = M4[0],
				M6 = M4[1],
				M7 = Object(B4.useState)(false),
				M8 = Object(B9.a)(M7, 2),
				M9 = M8[0],
				MB = M8[1],
				Mi = Object(B4.useState)(false),
				MS = Object(B9.a)(Mi, 2),
				MM = MS[0],
				Mp = MS[1],
				Ma = Object(B4.useState)(false),
				Ms = Object(B9.a)(Ma, 2),
				Mo = Ms[0],
				MQ = Ms[1],
				MO = Object(B4.useState)(false),
				Mn = Object(B9.a)(MO, 2),
				MK = Mn[0],
				Mb = Mn[1],
				Mg = Object(B4.useState)(false),
				MT = Object(B9.a)(Mg, 2),
				MN = MT[0],
				MG = MT[1],
				My = Object(B4.useState)(false),
				Mu = Object(B9.a)(My, 2),
				Mf = Mu[0],
				Mh = Mu[1],
				Mq = Object(B4.useState)(''),
				Mw = Object(B9.a)(Mq, 2),
				Mc = Mw[0],
				Mx = Mw[1]
			  return (
				Object(B4.useEffect)(function () {
				  Ba('getCryptoData', {}).then(function (Mv) {
					SP(Mv)
					SY(Mv)
				  })
				}, []),
				Bi('closeApps', function () {
				  M6(false)
				  MB(false)
				  Mp(false)
				  MQ(false)
				  Mb(false)
				  MG(false)
				  Mh(false)
				  SE(false)
				  M1(false)
				  SD('')
				  Sj('')
				  SA('')
				}),
				Object(BG.jsxs)(BG.Fragment, {
				  children: [
					Object(BG.jsx)('div', {
					  className: Sc.cryptoPurchaseModalContainer,
					  style: { display: SL ? '' : 'none' },
					  children: Object(BG.jsxs)('div', {
						className: Sc.cryptoPurchaseModalInnerContainer,
						children: [
						  Object(BG.jsx)('div', {
							className: 'spinner-wrapper',
							style: { display: M5 ? '' : 'none' },
							children: Object(BG.jsxs)('div', {
							  className: 'lds-spinner',
							  children: [
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
							  ],
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'spinner-wrapper',
							style: { display: M9 ? '' : 'none' },
							children: Object(BG.jsx)(Bv.Checkmark, {
							  size: '56px',
							  color: '#009688',
							}),
						  }),
						  Object(BG.jsxs)('div', {
							className: 'component-simple-form',
							style: { display: M5 || MM ? 'none' : '' },
							children: [
							  Object(BG.jsx)('div', {
								style: {
								  justifyContent: 'center',
								  marginBottom: '10px',
								  display: Mo ? '' : 'none',
								},
								children: Object(BG.jsx)('i', {
								  className: 'fas fa-exclamation fa-2x',
								  style: { color: '#ffa726' },
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: {
								  justifyContent: 'center',
								  display: Mo ? '' : 'none',
								},
								children: Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
								  },
								  variant: 'body2',
								  gutterBottom: true,
								  children: Mc,
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: { display: Mo ? 'none' : '' },
								children: Object(BG.jsx)('div', {
								  className: 'input-wrapper',
								  children: Object(BG.jsx)(Bw.a, {
									fullWidth: true,
									sx: { width: '100%' },
									children: Object(BG.jsx)(Bc.a, {
									  className: Sc.input,
									  id: 'input-with-icon-textfield',
									  type: 'number',
									  label: 'Amount',
									  variant: 'standard',
									  onChange: function (Mk) {
										SD(Mk.target.value)
									  },
									  value: SX,
									  InputProps: {
										startAdornment: Object(BG.jsx)(Bx.a, {
										  position: 'start',
										  children: Object(BG.jsx)('i', {
											className: 'fas fa-sliders-h',
										  }),
										}),
									  },
									}),
								  }),
								}),
							  }),
							  Object(BG.jsx)('div', {
								className: 'validation-messages',
								style: { display: MK ? '' : 'none' },
								children: Object(BG.jsxs)('div', {
								  className: 'message',
								  style: { display: MK && Mf ? '' : 'none' },
								  children: [
									Object(BG.jsx)('i', {
									  className:
										'fas fa-exclamation fa-w-6 fa-fw fa-sm',
									}),
									Object(BG.jsx)(BO.a, {
									  style: {
										color: '#fff',
										wordBreak: 'break-word',
									  },
									  variant: 'body2',
									  gutterBottom: true,
									  children:
										'Amount must be at least 1 character',
									}),
								  ],
								}),
							  }),
							  Object(BG.jsxs)('div', {
								className: 'buttons',
								style: { justifyContent: Mo ? 'center' : '' },
								children: [
								  Object(BG.jsx)('div', {
									children: Object(BG.jsx)(Bk.a, {
									  onClick: function () {
										SE(false)
										MQ(false)
										Mb(false)
										Mh(false)
										SD('')
									  },
									  size: 'small',
									  color: 'warning',
									  variant: 'contained',
									  children: Mo ? 'Close' : 'Cancel',
									}),
								  }),
								  Object(BG.jsx)('div', {
									style: { display: Mo ? 'none' : '' },
									children: Object(BG.jsx)(Bk.a, {
									  onClick: function () {
										if (0 === SX.length) {
										  return Mb(true), void Mh(true)
										}
										M6(true)
										Mp(true)
										Ba('purchaseCrypto', {
										  id: M2,
										  amount: SX,
										}).then(function (Mv) {
										  true === Mv.success
											? (SD(''),
											  SP(Mv.data),
											  SY(Mv.data),
											  Mb(false),
											  setTimeout(function () {
												M6(false)
												MB(true)
												setTimeout(function () {
												  MB(false)
												  SE(false)
												  Mp(false)
												}, 1500)
											  }, 500))
											: (M6(false),
											  Mp(false),
											  Mx(Mv.message),
											  MQ(true),
											  SD(''),
											  Mb(false))
										})
									  },
									  size: 'small',
									  color: 'success',
									  variant: 'contained',
									  children: 'Submit',
									}),
								  }),
								],
							  }),
							],
						  }),
						],
					  }),
					}),
					Object(BG.jsx)('div', {
					  className: Sc.cryptoExchangeModalContainer,
					  style: { display: SU ? '' : 'none' },
					  children: Object(BG.jsxs)('div', {
						className: Sc.cryptoExchangeModalInnerContainer,
						children: [
						  Object(BG.jsx)('div', {
							className: 'spinner-wrapper',
							style: { display: M5 ? '' : 'none' },
							children: Object(BG.jsxs)('div', {
							  className: 'lds-spinner',
							  children: [
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
							  ],
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'spinner-wrapper',
							style: { display: M9 ? '' : 'none' },
							children: Object(BG.jsx)(Bv.Checkmark, {
							  size: '56px',
							  color: '#009688',
							}),
						  }),
						  Object(BG.jsxs)('div', {
							className: 'component-simple-form',
							style: { display: M5 || MM ? 'none' : '' },
							children: [
							  Object(BG.jsx)('div', {
								style: {
								  justifyContent: 'center',
								  marginBottom: '10px',
								  display: Mo ? '' : 'none',
								},
								children: Object(BG.jsx)('i', {
								  className: 'fas fa-exclamation fa-2x',
								  style: { color: '#ffa726' },
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: {
								  justifyContent: 'center',
								  display: Mo ? '' : 'none',
								},
								children: Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
								  },
								  variant: 'body2',
								  gutterBottom: true,
								  children: Mc,
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: { display: Mo ? 'none' : '' },
								children: Object(BG.jsx)('div', {
								  className: 'input-wrapper',
								  children: Object(BG.jsx)(Bw.a, {
									fullWidth: true,
									sx: { width: '100%' },
									children: Object(BG.jsx)(Bc.a, {
									  className: Sc.input,
									  id: 'input-with-icon-textfield',
									  label: 'Crypto ID',
									  type: 'number',
									  variant: 'standard',
									  value: M2,
									  InputProps: {
										readOnly: true,
										startAdornment: Object(BG.jsx)(Bx.a, {
										  position: 'start',
										  children: Object(BG.jsx)('i', {
											className: 'fas fa-id-card',
										  }),
										}),
									  },
									}),
								  }),
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: { display: Mo ? 'none' : '' },
								children: Object(BG.jsx)('div', {
								  className: 'input-wrapper',
								  children: Object(BG.jsx)(Bw.a, {
									fullWidth: true,
									sx: { width: '100%' },
									children: Object(BG.jsx)(Bc.a, {
									  id: 'input-with-icon-textfield',
									  label: 'Phone Number',
									  type: 'tel',
									  variant: 'standard',
									  onChange: function (Mk) {
										Sj(Mk.target.value)
									  },
									  value: Sd,
									  inputProps: { maxLength: 10 },
									  InputProps: {
										startAdornment: Object(BG.jsx)(Bx.a, {
										  position: 'start',
										  children: Object(BG.jsx)('i', {
											className: 'fas fa-phone-volume',
										  }),
										}),
									  },
									}),
								  }),
								}),
							  }),
							  Object(BG.jsx)('div', {
								style: { display: Mo ? 'none' : '' },
								children: Object(BG.jsx)('div', {
								  className: 'input-wrapper',
								  children: Object(BG.jsx)(Bw.a, {
									fullWidth: true,
									sx: { width: '100%' },
									children: Object(BG.jsx)(Bc.a, {
									  className: Sc.input,
									  id: 'input-with-icon-textfield',
									  label: 'Amount',
									  type: 'number',
									  variant: 'standard',
									  onChange: function (Mk) {
										SA(Mk.target.value)
									  },
									  value: SR,
									  InputProps: {
										startAdornment: Object(BG.jsx)(Bx.a, {
										  position: 'start',
										  children: Object(BG.jsx)('i', {
											className: 'fas fa-sliders-h',
										  }),
										}),
									  },
									}),
								  }),
								}),
							  }),
							  Object(BG.jsxs)('div', {
								className: 'validation-messages',
								style: { display: MK ? '' : 'none' },
								children: [
								  Object(BG.jsxs)('div', {
									className: 'message',
									style: { display: MK && MN ? '' : 'none' },
									children: [
									  Object(BG.jsx)('i', {
										className:
										  'fas fa-exclamation fa-w-6 fa-fw fa-sm',
									  }),
									  Object(BG.jsx)(BO.a, {
										style: {
										  color: '#fff',
										  wordBreak: 'break-word',
										},
										variant: 'body2',
										gutterBottom: true,
										children:
										  'Phone Number must be 10 numbers',
									  }),
									],
								  }),
								  Object(BG.jsxs)('div', {
									className: 'message',
									style: { display: MK && Mf ? '' : 'none' },
									children: [
									  Object(BG.jsx)('i', {
										className:
										  'fas fa-exclamation fa-w-6 fa-fw fa-sm',
									  }),
									  Object(BG.jsx)(BO.a, {
										style: {
										  color: '#fff',
										  wordBreak: 'break-word',
										},
										variant: 'body2',
										gutterBottom: true,
										children:
										  'Amount must be at least 1 character',
									  }),
									],
								  }),
								],
							  }),
							  Object(BG.jsxs)('div', {
								className: 'buttons',
								style: { justifyContent: Mo ? 'center' : '' },
								children: [
								  Object(BG.jsx)('div', {
									children: Object(BG.jsx)(Bk.a, {
									  onClick: function () {
										M1(false)
										MQ(false)
										Mb(false)
										MG(false)
										Mh(false)
										Sj('')
										SA('')
									  },
									  size: 'small',
									  color: 'warning',
									  variant: 'contained',
									  children: Mo ? 'Close' : 'Cancel',
									}),
								  }),
								  Object(BG.jsx)('div', {
									style: { display: Mo ? 'none' : '' },
									children: Object(BG.jsx)(Bk.a, {
									  onClick: function () {
										return 0 === Sd.length && 0 === SR.length
										  ? (Mb(true), MG(true), void Mh(true))
										  : (Mb(false),
											MG(false),
											Mh(false),
											0 === Sd.length && 0 !== SR.length
											  ? (Mb(true), void MG(true))
											  : (Mb(false),
												MG(false),
												0 === SR.length && 0 !== Sd.length
												  ? (Mb(true), void Mh(true))
												  : (Mb(false),
													Mh(false),
													Sd.length < 10
													  ? (Mb(true), void MG(true))
													  : (Mb(false),
														MG(false),
														Mb(false),
														MG(false),
														Mh(false),
														M6(true),
														Mp(true),
														void Ba(
														  'exchangeCrypto',
														  {
															id: M2,
															number: Sd,
															amount: SR,
														  }
														).then(function (Mv) {
														  true === Mv.success
															? (Sj(''),
															  SA(''),
															  SP(Mv.data),
															  SY(Mv.data),
															  setTimeout(
																function () {
																  M6(false)
																  MB(true)
																  setTimeout(
																	function () {
																	  MB(false)
																	  M1(false)
																	  Mp(false)
																	},
																	1500
																  )
																},
																500
															  ))
															: (M6(false),
															  Mp(false),
															  Mx(Mv.message),
															  MQ(true),
															  Sj(''),
															  SA(''))
														})))))
									  },
									  size: 'small',
									  color: 'success',
									  variant: 'contained',
									  children: 'Submit',
									}),
								  }),
								],
							  }),
							],
						  }),
						],
					  }),
					}),
					Object(BG.jsx)(is, {
					  emptyMessage: 0 === Sm.length,
					  primaryActions: [],
					  search: {
						filter: ['name'],
						list: Sv,
						onChange: SY,
					  },
					  children:
						Sm && Sm.length > 0
						  ? Sm.map(function (Mk, Mv) {
							  return Object(BG.jsx)(
								il,
								{
								  id: Mk.id,
								  icon: Mk.icon,
								  name: Mk.name,
								  amount: Mk.amount,
								  tag: Mk.tag,
								  value: Mk.value,
								  buyable: Mk.canbuy,
								  exchangeable: Mk.canexchange,
								  sellable: Mk.cansell,
								},
								Mv
							  )
							})
						  : Object(BG.jsx)(BG.Fragment, {}),
					}),
				  ],
				})
			  )
			}
		  },
		  ij = B2(262),
		  iH = B2(243),
		  iI = Object(i4.a)({
			racingOuterContainer: {
			  width: '100%',
			  height: '100%',
			  overflow: 'hidden',
			  position: 'absolute',
			  bottom: '0%',
			  opacity: '1',
			},
			racingInnerContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  position: 'absolute',
			  transition: 'all 400ms ease 0s',
			  willChange: 'left',
			},
			racingSearch: {
			  width: '100%',
			  height: '64px',
			  display: 'flex',
			  padding: '8px 16px',
			  position: 'relative',
			  marginBottom: '8px',
			},
			racingSearchWrapper: {
			  width: '100%',
			  position: 'relative',
			},
			racingIcon: {
			  top: '32px',
			  right: '16px',
			  display: 'flex',
			  zIndex: '1',
			  position: 'absolute',
			  justifyContent: 'flex-end',
			},
			racingIconWrapper: {
			  color: '#fff',
			  marginLeft: '16px',
			},
			racingWrapper: {
			  maxHeight: '41vh',
			  width: '100%',
			  overflowY: 'auto',
			  position: 'absolute',
			  top: '10vh',
			},
			racingPending: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  maxHeight: 'calc(100% - 72px)',
			},
			racingActive: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  maxHeight: 'calc(100% - 72px)',
			},
			racingCompleted: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  maxHeight: 'calc(100% - 72px)',
			},
			racingTracks: {
			  width: '100%',
			  padding: '0px 16px',
			  overflow: 'hidden scroll',
			},
			racingCreateRaceModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			racingCreateRaceModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
		  }),
		  iR = function (Sw) {
			var Sx = Object(BP.c)(BZ),
			  Sk = Object(B9.a)(Sx, 2),
			  Sv = Sk[0],
			  SP = Sk[1],
			  SZ = Object(B4.useState)(false),
			  SV = Object(B9.a)(SZ, 2),
			  Sm = SV[0],
			  SY = SV[1]
			return Object(BG.jsx)(BG.Fragment, {
			  children: Object(BG.jsxs)(
				'div',
				{
				  id: Sw.id,
				  className: 'component-paper cursor-pointer',
				  onClick: function () {
					SY(!Sm)
				  },
				  onMouseEnter: function (Sz) {
					SP(Sz.currentTarget.id)
				  },
				  onMouseLeave: function () {
					SP('')
				  },
				  children: [
					Object(BG.jsxs)('div', {
					  className: 'main-container',
					  children: [
						Object(BG.jsxs)('div', {
						  className: 'details',
						  children: [
							Object(BG.jsx)('div', {
							  className: 'title',
							  children: Object(BG.jsx)(BO.a, {
								style: {
								  color: '#fff',
								  wordBreak: 'break-word',
								},
								variant: 'body2',
								gutterBottom: true,
								children: Sw.name,
							  }),
							}),
							Object(BG.jsx)('div', {
							  className: 'description',
							  children: Object(BG.jsxs)('div', {
								className: 'flex-row',
								style: { justifyContent: 'space-between' },
								children: [
								  Object(BG.jsx)(BO.a, {
									style: {
									  color: '#fff',
									  wordBreak: 'break-word',
									},
									variant: 'body2',
									gutterBottom: true,
									children: Sw.lapText,
								  }),
								  Object(BG.jsx)(BO.a, {
									style: {
									  color: '#fff',
									  wordBreak: 'break-word',
									},
									variant: 'body2',
									gutterBottom: true,
									children: Sw.distText,
								  }),
								],
							  }),
							}),
						  ],
						}),
						Object(BG.jsx)('div', {
						  className:
							Sv.toString() === Sw.id.toString() &&
							Sw.cid.toString() === Sw.data.owner.toString() &&
							'active' === Sw.type
							  ? 'actions actions-show'
							  : 'actions',
						  children: Object(BG.jsx)(Bg.a, {
							title: 'End Race',
							placement: 'top',
							sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
							arrow: true,
							children: Object(BG.jsx)('div', {
							  style: {
								display:
								  Sw.cid.toString() === Sw.data.owner.toString()
									? ''
									: 'none',
							  },
							  children: Object(BG.jsx)('i', {
								id: Sw.id,
								onClick: function (Sz) {
								  Sz.stopPropagation()
								  Ba('endRace', { id: Sz.currentTarget.id })
								},
								className: 'fas fa-trash-alt fa-w-16 fa-fw fa-lg',
							  }),
							}),
						  }),
						}),
					  ],
					}),
					Object(BG.jsx)(iw.a, {
					  in: Sm,
					  timeout: 'auto',
					  unmountOnExit: true,
					  children:
						Sw.players && Object.keys(Sw.players).length > 0
						  ? Object.values(Sw.players).map(function (Sz, SF) {
							  return Object(BG.jsx)(Bw.a, {
								sx: {
								  width: '85%',
								  marginLeft: '7.5%',
								  marginBottom: '1.5%',
								},
								children: Object(BG.jsx)(Bc.a, {
								  id: 'input-with-icon-textfield',
								  variant: 'standard',
								  value: Sz.name,
								  InputProps: {
									readOnly: true,
									startAdornment: Object(BG.jsx)(Bx.a, {
									  position: 'start',
									  children: Object(BG.jsx)('i', {
										className: 'fas fa-user',
									  }),
									}),
								  },
								}),
							  })
							})
						  : Object(BG.jsx)(BG.Fragment, {}),
					}),
				  ],
				},
				Sw.id
			  ),
			})
		  },
		  iA = function (Sw) {
			{
			  var Sx = Object(BP.c)(BZ),
				Sk = Object(B9.a)(Sx, 2),
				Sv = Sk[0],
				SP = Sk[1],
				SZ = Object(B4.useState)(false),
				SV = Object(B9.a)(SZ, 2),
				Sm = SV[0],
				SY = SV[1]
			  return Object(BG.jsx)(BG.Fragment, {
				children: Object(BG.jsxs)(
				  'div',
				  {
					id: Sw.id,
					className: 'component-paper cursor-pointer',
					onClick: function () {
					  SY(!Sm)
					},
					onMouseEnter: function (Sz) {
					  SP(Sz.currentTarget.id)
					},
					onMouseLeave: function () {
					  SP('')
					},
					children: [
					  Object(BG.jsxs)('div', {
						className: 'main-container',
						children: [
						  Object(BG.jsxs)('div', {
							className: 'details',
							children: [
							  Object(BG.jsx)('div', {
								className: 'title',
								children: Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
								  },
								  variant: 'body2',
								  gutterBottom: true,
								  children: Sw.name,
								}),
							  }),
							  Object(BG.jsx)('div', {
								className: 'description',
								children: Object(BG.jsxs)('div', {
								  className: 'flex-row',
								  style: { justifyContent: 'space-between' },
								  children: [
									Object(BG.jsx)(BO.a, {
									  style: {
										color: '#fff',
										wordBreak: 'break-word',
									  },
									  variant: 'body2',
									  gutterBottom: true,
									  children: Sw.lapText,
									}),
									Object(BG.jsx)(BO.a, {
									  style: {
										color: '#fff',
										wordBreak: 'break-word',
									  },
									  variant: 'body2',
									  gutterBottom: true,
									  children: Sw.distText,
									}),
								  ],
								}),
							  }),
							],
						  }),
						  Object(BG.jsxs)('div', {
							className:
							  Sv.toString() === Sw.id.toString()
								? 'actions actions-show'
								: 'actions',
							children: [
							  Object(BG.jsx)(Bg.a, {
								title: 'Leave Race',
								placement: 'top',
								sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
								arrow: true,
								children: Object(BG.jsx)('div', {
								  style: {
									display: Sw.data.players[Sw.cid]
									  ? ''
									  : 'none',
								  },
								  children: Object(BG.jsx)('i', {
									id: Sw.id,
									onClick: function (Sz) {
									  Sz.stopPropagation()
									  Ba('leaveRace', { id: Sz.currentTarget.id })
									},
									className:
									  'fas fa-user-times fa-w-16 fa-fw fa-lg',
								  }),
								}),
							  }),
							  Object(BG.jsx)(Bg.a, {
								title: 'Start Race',
								placement: 'top',
								sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
								arrow: true,
								children: Object(BG.jsx)('div', {
								  style: {
									display:
									  Sw.data.owner.toString() ===
										Sw.cid.toString() &&
									  Sw.data.players[Sw.cid]
										? ''
										: 'none',
								  },
								  children: Object(BG.jsx)('i', {
									id: Sw.id,
									onClick: function () {
									  {
										return (
										  (SF = Sw.id),
										  (SX = Sw.data.countdown),
										  void Ba('startRace', {
											id: SF,
											countdown: SX,
										  })
										)
										var SF, SX
									  }
									},
									className: 'fas fa-play fa-w-16 fa-fw fa-lg',
								  }),
								}),
							  }),
							  Object(BG.jsx)(Bg.a, {
								title: 'Set GPS',
								placement: 'top',
								sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
								arrow: true,
								children: Object(BG.jsx)('div', {
								  children: Object(BG.jsx)('i', {
									id: Sw.id,
									onClick: function (Sz) {
									  Sz.stopPropagation()
									  Ba('locateRace', {
										id: Sz.currentTarget.id,
									  })
									},
									className:
									  'fas fa-map-marker fa-w-16 fa-fw fa-lg',
								  }),
								}),
							  }),
							  Object(BG.jsx)(Bg.a, {
								title: 'Preview Race',
								placement: 'top',
								sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
								arrow: true,
								children: Object(BG.jsx)('div', {
								  children: Object(BG.jsx)('i', {
									id: Sw.id,
									onClick: function (Sz) {
									  Sz.stopPropagation()
									  Ba('previewRace', {
										id: Sz.currentTarget.id,
									  })
									},
									className: 'fas fa-map fa-w-16 fa-fw fa-lg',
								  }),
								}),
							  }),
							  Object(BG.jsx)(Bg.a, {
								title: 'Join Race',
								placement: 'top',
								sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
								arrow: true,
								children: Object(BG.jsx)('div', {
								  style: {
									display: Sw.data.players[Sw.cid]
									  ? 'none'
									  : '',
								  },
								  children: Object(BG.jsx)('i', {
									id: Sw.id,
									onClick: function (Sz) {
									  Sz.stopPropagation()
									  Ba('joinRace', { id: Sz.currentTarget.id })
									},
									className:
									  'fas fa-user-plus fa-w-16 fa-fw fa-lg',
								  }),
								}),
							  }),
							],
						  }),
						],
					  }),
					  Object(BG.jsx)(iw.a, {
						in: Sm,
						timeout: 'auto',
						unmountOnExit: true,
						children:
						  Sw.players && Object.keys(Sw.players).length > 0
							? Object.values(Sw.players).map(function (Sz, SF) {
								return Object(BG.jsx)(Bw.a, {
								  sx: {
									width: '85%',
									marginLeft: '7.5%',
									marginBottom: '1.5%',
								  },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									variant: 'standard',
									value: Sz.name,
									InputProps: {
									  readOnly: true,
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)('i', {
										  className: 'fas fa-user',
										}),
									  }),
									},
								  }),
								})
							  })
							: Object(BG.jsx)(BG.Fragment, {}),
					  }),
					],
				  },
				  Sw.id
				),
			  })
			}
		  },
		  iL = function () {
			var Sc = iI(),
			  Sx = Object(BP.c)(BZ),
			  Sk = Object(B9.a)(Sx, 2),
			  Sv = Sk[0],
			  SP = Sk[1],
			  SZ = B5.a.useState(0),
			  SV = Object(B9.a)(SZ, 2),
			  Sm = SV[0],
			  SY = SV[1],
			  Sz = Object(B4.useState)([]),
			  SF = Object(B9.a)(Sz, 2),
			  SX = (SF[0], SF[1], Object(B4.useState)([])),
			  SD = Object(B9.a)(SX, 2),
			  Sr = SD[0],
			  Sl = SD[1],
			  Sd = Object(B4.useState)([]),
			  Sj = Object(B9.a)(Sd, 2),
			  SH = Sj[0],
			  SI = Sj[1],
			  SR = Object(B4.useState)([]),
			  SA = Object(B9.a)(SR, 2),
			  SL = SA[0],
			  SJ = SA[1],
			  SC = Object(B4.useState)([]),
			  SE = Object(B9.a)(SC, 2),
			  SU = SE[0],
			  SW = SE[1],
			  M0 = Object(B4.useState)([]),
			  M1 = Object(B9.a)(M0, 2),
			  M2 = M1[0],
			  M3 = M1[1],
			  M4 = Object(B4.useState)(0),
			  M5 = Object(B9.a)(M4, 2),
			  M6 = M5[0],
			  M7 = M5[1],
			  M8 = Object(B4.useState)(false),
			  M9 = Object(B9.a)(M8, 2),
			  MB = M9[0],
			  Mi = M9[1],
			  MS = Object(B4.useState)(false),
			  MM = Object(B9.a)(MS, 2),
			  Mp = MM[0],
			  Ma = MM[1],
			  Ms = Object(B4.useState)(false),
			  Mo = Object(B9.a)(Ms, 2),
			  MQ = Mo[0],
			  MO = Mo[1],
			  Mn = Object(B4.useState)(false),
			  MK = Object(B9.a)(Mn, 2),
			  Mb = MK[0],
			  Mg = MK[1],
			  MT = Object(B4.useState)(''),
			  MN = Object(B9.a)(MT, 2),
			  MG = MN[0],
			  My = MN[1],
			  Mu = Object(B4.useState)(''),
			  Mf = Object(B9.a)(Mu, 2),
			  Mh = Mf[0],
			  Mq = Mf[1],
			  Mw = Object(B4.useState)(''),
			  Mc = Object(B9.a)(Mw, 2),
			  Mx = Mc[0],
			  Mk = Mc[1],
			  Mv = Object(B4.useState)(''),
			  MP = Object(B9.a)(Mv, 2),
			  MZ = MP[0],
			  MV = MP[1],
			  Mm = Object(B4.useState)(''),
			  MY = Object(B9.a)(Mm, 2),
			  Mz = MY[0],
			  MF = MY[1],
			  MX = Object(B4.useState)(''),
			  MD = Object(B9.a)(MX, 2),
			  Mr = MD[0],
			  Ml = MD[1],
			  Md = Object(B4.useState)(''),
			  Mj = Object(B9.a)(Md, 2),
			  MH = Mj[0],
			  MI = Mj[1],
			  MR = Object(B4.useState)(false),
			  MA = Object(B9.a)(MR, 2),
			  ML = MA[0],
			  MJ = MA[1],
			  MC = Object(B4.useState)(false),
			  ME = Object(B9.a)(MC, 2),
			  MU = ME[0],
			  MW = ME[1],
			  p0 = Object(B4.useState)(false),
			  p1 = Object(B9.a)(p0, 2),
			  p2 = p1[0],
			  p3 = p1[1]
			Object(B4.useEffect)(function () {
			  Ba('getRacingData', {}).then(function (p9) {
				undefined !== p9.races.pendingRaces && Sl(p9.races.pendingRaces)
				undefined !== p9.races.activeRaces && SI(p9.races.activeRaces)
				undefined !== p9.races.finishedRaces && SJ(p9.races.finishedRaces)
				SW(p9.tracks)
				M3(p9.tracks)
				M7(p9.cid)
			  })
			}, [])
			var p4 = function (p8) {
				SP(p8.currentTarget.id)
			  },
			  p5 = function () {
				SP('')
			  },
			  p6 = function (p8) {
				Ba('setTrackGps', { id: p8.currentTarget.id })
			  },
			  p7 = function (p8) {
				Mg(true)
				MV(p8.currentTarget.id)
			  }
			return (
			  Bi('updateRacing', function (p8) {
				undefined !== p8.pending && Sl(p8.pending)
				undefined !== p8.active && SI(p8.active)
				undefined !== p8.completed && SJ(p8.completed)
			  }),
			  Bi('closeApps', function () {
				Mg(false)
				Mi(false)
				Ma(false)
				MO(false)
				My('')
				Mq('')
				Mk('')
			  }),
			  Object(BG.jsxs)(BG.Fragment, {
				children: [
				  Object(BG.jsx)('div', {
					className: Sc.racingCreateRaceModalContainer,
					style: { display: Mb ? '' : 'none' },
					children: Object(BG.jsxs)('div', {
					  className: Sc.racingCreateRaceModalInnerContainer,
					  children: [
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: MB ? '' : 'none' },
						  children: Object(BG.jsxs)('div', {
							className: 'lds-spinner',
							children: [
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: Mp ? '' : 'none' },
						  children: Object(BG.jsx)(Bv.Checkmark, {
							size: '56px',
							color: '#009688',
						  }),
						}),
						Object(BG.jsxs)('div', {
						  className: 'component-simple-form',
						  style: { display: MB || MQ ? 'none' : '' },
						  children: [
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Event Name',
									variant: 'standard',
									onChange: function (p8) {
									  My(p8.target.value)
									},
									value: MG,
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)('i', {
										  className: 'fas fa-user',
										}),
									  }),
									},
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Laps',
									variant: 'standard',
									onChange: function (p8) {
									  Mq(p8.target.value)
									},
									value: Mh,
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)('i', {
										  className: 'fas fa-flag-checkered',
										}),
									  }),
									},
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Amount',
									variant: 'standard',
									onChange: function (p8) {
									  MF(p8.target.value)
									},
									value: Mz,
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)('i', {
										  className: 'fas fa-dollar-sign',
										}),
									  }),
									},
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Countdown to Start',
									variant: 'standard',
									onChange: function (p8) {
									  Mk(p8.target.value)
									},
									value: Mx,
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)('i', {
										  className: 'fas fa-stopwatch-20',
										}),
									  }),
									},
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'DNF Position',
									variant: 'standard',
									onChange: function (p8) {
									  Ml(p8.target.value)
									},
									value: Mr,
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)('i', {
										  className: 'fas fa-sad-cry',
										}),
									  }),
									},
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'DNF Countdown',
									variant: 'standard',
									onChange: function (p8) {
									  MI(p8.target.value)
									},
									value: MH,
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)('i', {
										  className: 'fas fa-stopwatch-20',
										}),
									  }),
									},
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsxs)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: [
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: ML,
										onChange: function (p8) {
										  MJ(p8.target.checked)
										},
									  }),
									  label: 'Show Position',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: MU,
										onChange: function (p8) {
										  MW(p8.target.checked)
										},
									  }),
									  label: 'Send Notification',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: p2,
										onChange: function (p8) {
										  p3(p8.target.checked)
										},
									  }),
									  label: 'Bubble Remover V2',
									}),
								  ],
								}),
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: 'buttons',
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  Mg(false)
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Cancel',
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  undefined !== MG &&
										'' !== MG &&
										undefined !== Mh &&
										'' !== Mh &&
										undefined !== Mx &&
										'' !== Mx &&
										undefined !== Mz &&
										'' !== Mz &&
										undefined !== Mr &&
										'' !== Mr &&
										undefined !== MH &&
										'' !== MH &&
										(Mi(true),
										MO(true),
										Ba('createRace', {
										  id: MZ,
										  options: {
											eventName: MG,
											laps: Mh,
											buyIn: Mz,
											countdown: Mx,
											dnfPosition: Mr,
											dnfCountdown: MH,
											showPosition: ML,
											sendNotification: MU,
											bubbleRemover: p2,
										  },
										}).then(function (p9) {
										  My('')
										  Mq('')
										  Mk('')
										  MF('')
										  Ml('')
										  MI('')
										  MJ(false)
										  MW(false)
										  p3(false)
										  Mi(false)
										  Ma(true)
										  setTimeout(function () {
											Ma(false)
											Mg(false)
											MO(false)
										  }, 1000)
										}))
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Submit',
								  }),
								}),
							  ],
							}),
						  ],
						}),
					  ],
					}),
				  }),
				  Object(BG.jsx)('div', {
					className: Sc.racingOuterContainer,
					style: { zIndex: 500 },
					children: Object(BG.jsx)('div', {
					  className: Sc.racingInnerContainer,
					  children: Object(BG.jsxs)('div', {
						className: 'racing-container',
						children: [
						  Object(BG.jsx)('div', {
							className: Sc.racingSearch,
							children: Object(BG.jsxs)('div', {
							  className: Sc.racingSearchWrapper,
							  children: [
								Object(BG.jsxs)(iY.a, {
								  centered: true,
								  style: { width: '100%' },
								  value: Sm,
								  onChange: function (p8, p9) {
									SY(p9)
								  },
								  'aria-label': 'icon tabs example',
								  children: [
									Object(BG.jsx)(iz.a, {
									  style: { minWidth: '25%' },
									  icon: Object(BG.jsx)('i', {
										className: 'fas fa-flag-checkered fa-lg',
									  }),
									  'aria-label': 'races',
									}),
									Object(BG.jsx)(iz.a, {
									  style: { minWidth: '25%' },
									  icon: Object(BG.jsx)('i', {
										className: 'fas fa-map-marker fa-lg',
									  }),
									  'aria-label': 'maps',
									}),
									Object(BG.jsx)(iz.a, {
									  style: { minWidth: '25%' },
									  icon: Object(BG.jsx)('i', {
										className: 'fas fa-trophy fa-lg',
									  }),
									  'aria-label': 'leaderboard',
									}),
									Object(BG.jsx)(iz.a, {
									  style: { minWidth: '25%' },
									  icon: Object(BG.jsx)('i', {
										className: 'fas fa-medal fa-lg',
									  }),
									  'aria-label': 'highscores',
									}),
								  ],
								}),
								Object(BG.jsx)('div', {
								  className: 'input-wrapper',
								  style: {
									display: 1 === Sm ? 'flex' : 'none',
									justifyContent: 'center',
									marginTop: '5%',
								  },
								  children: Object(BG.jsx)(Bw.a, {
									sx: { width: '86%' },
									children: Object(BG.jsx)(Bc.a, {
									  id: 'input-with-icon-textfield',
									  label: 'Search',
									  onChange: function (p8) {
										return (function (p9) {
										  {
											if ('' !== p9) {
											  var pi = SU.filter(function (pS) {
												return pS.name
												  .toLowerCase()
												  .startsWith(p9.toLowerCase())
											  })
											  M3(pi)
											} else {
											  M3(SU)
											}
										  }
										})(p8.target.value)
									  },
									  InputProps: {
										startAdornment: Object(BG.jsx)(Bx.a, {
										  position: 'start',
										  children: Object(BG.jsx)(ia.a, {}),
										}),
									  },
									  variant: 'standard',
									}),
								  }),
								}),
							  ],
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: Sc.racingIcon,
							children: Object(BG.jsx)('div', {
							  className: Sc.racingIconWrapper,
							}),
						  }),
						  Object(BG.jsxs)('div', {
							className: Sc.racingWrapper,
							style: { display: 0 === Sm ? '' : 'none' },
							children: [
							  Object(BG.jsxs)('div', {
								className: Sc.racingPending,
								style: {
								  display: Sr && Sr.length > 0 ? '' : 'none',
								},
								children: [
								  Object(BG.jsx)(BO.a, {
									style: {
									  display: Sr && Sr.length > 0 ? '' : 'none',
									  color: '#fff',
									  wordBreak: 'break-word',
									  marginTop: '5px',
									},
									variant: 'body1',
									gutterBottom: true,
									children: 'Pending',
								  }),
								  Sr && Sr.length > 0
									? Sr.map(function (p8, p9) {
										return Object(BG.jsx)(iA, {
										  id: p8.id,
										  name: p8.eventName,
										  lapText: 'Laps ('.concat(
											p8.laps,
											') / Open'
										  ),
										  distText: ''.concat(
											Math.ceil(
											  0.00062137 * p8.mapDistance
											),
											'mi'
										  ),
										  cid: M6,
										  players: p8.players,
										  data: p8,
										})
									  })
									: Object(BG.jsx)(BG.Fragment, {}),
								],
							  }),
							  Object(BG.jsxs)('div', {
								className: Sc.racingActive,
								style: {
								  display: SH && SH.length > 0 ? '' : 'none',
								},
								children: [
								  Object(BG.jsx)(BO.a, {
									style: {
									  display: SH && SH.length > 0 ? '' : 'none',
									  color: '#fff',
									  wordBreak: 'break-word',
									  marginTop: '5px',
									},
									variant: 'body1',
									gutterBottom: true,
									children: 'Active',
								  }),
								  SH && SH.length > 0
									? SH.map(function (p8, p9) {
										return Object(BG.jsx)(iR, {
										  id: p8.id,
										  name: p8.eventName,
										  lapText: 'Laps ('.concat(
											p8.laps,
											') / Closed'
										  ),
										  distText: ''.concat(
											Math.ceil(
											  0.00062137 * p8.mapDistance
											),
											'mi'
										  ),
										  cid: M6,
										  players: p8.players,
										  data: p8,
										  type: 'active',
										})
									  })
									: Object(BG.jsx)(BG.Fragment, {}),
								],
							  }),
							  Object(BG.jsxs)('div', {
								className: Sc.racingCompleted,
								style: {
								  display: SL && SL.length > 0 ? '' : 'none',
								},
								children: [
								  Object(BG.jsx)(BO.a, {
									style: {
									  display: SL && SL.length > 0 ? '' : 'none',
									  color: '#fff',
									  wordBreak: 'break-word',
									  marginTop: '5px',
									},
									variant: 'body1',
									gutterBottom: true,
									children: 'Completed',
								  }),
								  SL && SL.length > 0
									? SL.map(function (p8, p9) {
										return Object(BG.jsx)(iR, {
										  id: p8.id,
										  name: p8.eventName,
										  lapText: 'Laps ('.concat(
											p8.laps,
											') / Closed'
										  ),
										  distText: ''.concat(
											Math.ceil(
											  0.00062137 * p8.mapDistance
											),
											'mi'
										  ),
										  cid: M6,
										  players: p8.players,
										  data: p8,
										  type: 'completed',
										})
									  })
									: Object(BG.jsx)(BG.Fragment, {}),
								],
							  }),
							],
						  }),
						  Object(BG.jsx)('div', {
							className: Sc.racingTracks,
							style: {
							  display: 1 === Sm ? '' : 'none',
							  marginTop: '25%',
							  height: '72%',
							  maxHeight: '72%',
							},
							children:
							  M2 && M2.length > 0
								? M2.map(function (p8, p9) {
									return Object(BG.jsx)(
									  'div',
									  {
										id: p8.id,
										className:
										  'component-paper cursor-pointer',
										style: { paddingBottom: '1.2%' },
										onMouseEnter: p4,
										onMouseLeave: p5,
										children: Object(BG.jsxs)('div', {
										  className: 'main-container',
										  children: [
											Object(BG.jsxs)('div', {
											  className: 'details',
											  children: [
												Object(BG.jsx)('div', {
												  className: 'title',
												  children: Object(BG.jsx)(BO.a, {
													style: {
													  color: '#fff',
													  wordBreak: 'break-word',
													},
													variant: 'body2',
													gutterBottom: true,
													children: p8.name,
												  }),
												}),
												Object(BG.jsx)('div', {
												  className: 'description',
												  children: Object(BG.jsx)(
													'div',
													{
													  className: 'flex-row',
													  children: Object(BG.jsx)(
														BO.a,
														{
														  style: {
															color: '#fff',
															wordBreak:
															  'break-word',
														  },
														  variant: 'body2',
														  gutterBottom: true,
														  children: p8.type,
														}
													  ),
													}
												  ),
												}),
											  ],
											}),
											Object(BG.jsxs)('div', {
											  className:
												Sv.toString() === p8.id.toString()
												  ? 'actions actions-show'
												  : 'actions',
											  children: [
												Object(BG.jsx)(Bg.a, {
												  title: 'Set GPS',
												  placement: 'top',
												  sx: {
													backgroundColor:
													  'rgba(97, 97, 97, 0.9)',
												  },
												  arrow: true,
												  children: Object(BG.jsx)(
													'div',
													{
													  children: Object(BG.jsx)(
														'i',
														{
														  id: p8.id,
														  onClick: p6,
														  className:
															'fas fa-map-marker fa-w-16 fa-fw fa-lg',
														}
													  ),
													}
												  ),
												}),
												Object(BG.jsx)(Bg.a, {
												  title: 'Create Race',
												  placement: 'top',
												  sx: {
													backgroundColor:
													  'rgba(97, 97, 97, 0.9)',
												  },
												  arrow: true,
												  children: Object(BG.jsx)(
													'div',
													{
													  children: Object(BG.jsx)(
														'i',
														{
														  id: p8.id,
														  onClick: p7,
														  className:
															'fas fa-flag-checkered fa-w-16 fa-fw fa-lg',
														}
													  ),
													}
												  ),
												}),
											  ],
											}),
											Object(BG.jsx)('div', {
											  className: 'image',
											  children: Object(BG.jsxs)(BO.a, {
												style: {
												  color: '#fff',
												  wordBreak: 'break-word',
												},
												variant: 'body2',
												gutterBottom: true,
												children: [
												  Math.ceil(
													0.00062137 * p8.distance
												  ),
												  '1mi',
												],
											  }),
											}),
										  ],
										}),
									  },
									  p8.id
									)
								  })
								: Object(BG.jsx)(BG.Fragment, {}),
						  }),
						],
					  }),
					}),
				  }),
				],
			  })
			)
		  },
		  iJ = B2(263),
		  iC = B2(253),
		  iE = B2(264),
		  iU = B2(266),
		  iW = B2(238),
		  S0 = B2(265),
		  S1 = Object(i4.a)({
			jobsOuterContainer: {
			  width: '100%',
			  height: '100%',
			  overflow: 'hidden',
			  position: 'absolute',
			  bottom: '0%',
			  opacity: '1',
			},
			jobsInnerContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  position: 'absolute',
			  transition: 'all 400ms ease 0s',
			  willChange: 'left',
			},
			jobsSearch: {
			  width: '100%',
			  height: '64px',
			  display: 'flex',
			  padding: '8px 16px',
			  position: 'relative',
			  marginBottom: '8px',
			},
			jobsSearchWrapper: {
			  width: '100%',
			  position: 'relative',
			},
			jobsIcon: {
			  top: '32px',
			  right: '16px',
			  display: 'flex',
			  zIndex: '1',
			  position: 'absolute',
			  justifyContent: 'flex-end',
			},
			jobsIconWrapper: {
			  color: '#fff',
			  marginLeft: '16px',
			},
			jobsJobs: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  overflow: 'hidden scroll',
			  maxHeight: 'calc(100% - 72px)',
			},
			jobsGroups: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  overflow: 'hidden scroll',
			  maxHeight: 'calc(100% - 72px)',
			},
			jobsGroupsIdle: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  maxHeight: 'calc(100% - 72px)',
			},
			jobsGroupsBusy: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  maxHeight: 'calc(100% - 72px)',
			},
			jobsInGroupLeader: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  maxHeight: 'calc(100% - 72px)',
			},
			jobsInGroupMembers: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  maxHeight: 'calc(100% - 72px)',
			},
			jobsGroupsWrapper: {
			  maxHeight: '41vh',
			  width: '100%',
			  overflowY: 'auto',
			  position: 'absolute',
			  top: '15vh',
			},
			jobsInGroupWrapper: {
			  maxHeight: '41vh',
			  width: '100%',
			  overflowY: 'auto',
			  position: 'absolute',
			},
			waitingForActivity: {
			  width: '88.6%',
			  marginLeft: '5.6%',
			  display: 'flex',
			  flexDirection: 'column',
			  justifyContent: 'center',
			  alignItems: 'center',
			  paddingBottom: '8px',
			  marginBottom: '8px',
			  borderBottom: '1px solid #fff',
			},
			jobsInGroupButtons: {
			  width: 'auto',
			  position: 'absolute',
			  top: '81%',
			  left: '50%',
			  transform: 'translate(-50%)',
			},
		  }),
		  S2 = function () {
			var Sc = S1(),
			  Sx = Object(BP.c)(BZ),
			  Sk = Object(B9.a)(Sx, 2),
			  Sv = Sk[0],
			  SP = Sk[1],
			  SZ = Object(B4.useState)([]),
			  SV = Object(B9.a)(SZ, 2),
			  Sm = SV[0],
			  SY = SV[1],
			  Sz = Object(B4.useState)(false),
			  SF = Object(B9.a)(Sz, 2),
			  SX = SF[0],
			  SD = SF[1],
			  Sr = Object(B4.useState)(false),
			  Sl = Object(B9.a)(Sr, 2),
			  Sd = Sl[0],
			  Sj = Sl[1],
			  SH = Object(B4.useState)(false),
			  SI = Object(B9.a)(SH, 2),
			  SR = SI[0],
			  SA = SI[1],
			  SL = Object(B4.useState)(false),
			  SJ = Object(B9.a)(SL, 2),
			  SC = SJ[0],
			  SE = SJ[1],
			  SU = Object(B4.useState)([]),
			  SW = Object(B9.a)(SU, 2),
			  M0 = SW[0],
			  M1 = SW[1],
			  M2 = Object(B4.useState)([]),
			  M3 = Object(B9.a)(M2, 2),
			  M4 = M3[0],
			  M5 = M3[1],
			  M6 = Object(B4.useState)([]),
			  M7 = Object(B9.a)(M6, 2),
			  M8 = M7[0],
			  M9 = M7[1],
			  MB = Object(B4.useState)([]),
			  Mi = Object(B9.a)(MB, 2),
			  MS = Mi[0],
			  MM = Mi[1],
			  Mp = Object(B4.useState)([]),
			  Ma = Object(B9.a)(Mp, 2),
			  Ms = Ma[0],
			  Mo = Ma[1],
			  MQ = Object(B4.useState)(0),
			  MO = Object(B9.a)(MQ, 2),
			  Mn = MO[0],
			  MK = MO[1],
			  Mb = Object(B4.useState)(''),
			  Mg = Object(B9.a)(Mb, 2),
			  MT = Mg[0],
			  MN = Mg[1],
			  MG = Object(B4.useState)(''),
			  My = Object(B9.a)(MG, 2),
			  Mu = My[0],
			  Mf = My[1],
			  Mh = Object(B4.useState)(''),
			  Mq = Object(B9.a)(Mh, 2),
			  Mw = Mq[0],
			  Mc = Mq[1]
			Object(B4.useEffect)(function () {
			  Ba('getJobsData', {}).then(function (MP) {
				if (MP.signedin) {
				  if (MP.ingroup) {
					var MZ = MP.groupdata
					MZ.inActivity
					  ? (SD(true),
						Sj(true),
						SE(true),
						MK(MZ.id),
						MN(MZ.leader),
						Mf(MP.src),
						Mo(MZ.tasks),
						Mc(MP.jobname))
					  : (SD(true),
						Sj(true),
						SE(false),
						MK(MZ.id),
						MN(MZ.leader),
						Mf(MP.src),
						MM(MZ.members),
						true === MZ.ready ? SA(true) : SA(false),
						Mo([]),
						Mc(''))
				  } else {
					SD(true)
					M5(MP.groups.idle)
					M9(MP.groups.busy)
				  }
				} else {
				  SD(false)
				  SA(false)
				  Sj(false)
				  SE(false)
				  SY(MP.jobs)
				  M1(MP.jobs)
				}
			  })
			}, [])
			var Mx = function (Mv) {
				SP(Mv.currentTarget.id)
			  },
			  Mk = function () {
				SP('')
			  }
			return (
			  Bi('updateGroups', function () {
				Ba('getJobsData', {}).then(function (MP) {
				  if (MP.signedin) {
					if (MP.ingroup) {
					  var MZ = MP.groupdata
					  MZ.inActivity
						? (SD(true),
						  Sj(true),
						  SE(true),
						  MK(MZ.id),
						  MN(MZ.leader),
						  Mf(MP.src),
						  Mo(MZ.tasks),
						  Mc(MP.jobname))
						: (SD(true),
						  Sj(true),
						  SE(false),
						  MK(MZ.id),
						  MN(MZ.leader),
						  Mf(MP.src),
						  MM(MZ.members),
						  true === MZ.ready ? SA(true) : SA(false),
						  Mo([]),
						  Mc(''))
					} else {
					  SD(true)
					  Sj(false)
					  SA(false)
					  SE(false)
					  M5(MP.groups.idle)
					  M9(MP.groups.busy)
					}
				  } else {
					SD(false)
					Sj(false)
					SA(false)
					SE(false)
					SY(MP.jobs)
					M1(MP.jobs)
				  }
				})
			  }),
			  Object(BG.jsx)(BG.Fragment, {
				children: Object(BG.jsx)('div', {
				  className: Sc.jobsOuterContainer,
				  style: { zIndex: 500 },
				  children: Object(BG.jsx)('div', {
					className: Sc.jobsInnerContainer,
					children: Object(BG.jsxs)('div', {
					  className: 'jobs-container',
					  children: [
						Object(BG.jsx)('div', {
						  className: Sc.jobsSearch,
						  style: {
							height: SX ? '20%' : '64px',
							display: SC ? 'none' : '',
						  },
						  children: Object(BG.jsxs)('div', {
							className: Sc.jobsSearchWrapper,
							style: { width: SX ? 'auto' : '100%' },
							children: [
							  Object(BG.jsx)(BO.a, {
								style: {
								  display: SX && !Sd ? '' : 'none',
								  color: '#fff',
								  wordBreak: 'break-word',
								},
								variant: 'body1',
								gutterBottom: true,
								children:
								  'Join an idle group or browse groups currently busy',
							  }),
							  Object(BG.jsxs)(BW.a, {
								direction: 'row',
								spacing: 4.6,
								style: { display: SX && !Sd ? '' : 'none' },
								children: [
								  Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  Ba('createGroup')
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Create Group',
								  }),
								  Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  Ba('checkOut')
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Check Out',
								  }),
								],
							  }),
							  Object(BG.jsx)(ig.a, {
								variant: 'middle',
								sx: {
								  display: SX && !Sd ? '' : 'none',
								  borderColor: '#aeb0b2',
								  marginTop: '5%',
								  marginLeft: '0%',
								  marginRight: '0%',
								},
							  }),
							  Object(BG.jsx)('div', {
								className: 'input-wrapper',
								style: { display: SX ? 'none' : '' },
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Search',
									onChange: function (Mv) {
									  return (function (MZ) {
										if ('' !== MZ) {
										  var Mm = Sm.filter(function (MY) {
											return (
											  MY.id
												.toLowerCase()
												.startsWith(MZ.toLowerCase()) ||
											  MY.name
												.toLowerCase()
												.startsWith(MZ.toLowerCase())
											)
										  })
										  M1(Mm)
										} else {
										  M1(Sm)
										}
									  })(Mv.target.value)
									},
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)(ia.a, {}),
									  }),
									},
									variant: 'standard',
								  }),
								}),
							  }),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: Sc.jobsIcon,
						  children: Object(BG.jsx)('div', {
							className: Sc.jobsIconWrapper,
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: Sc.jobsJobs,
						  style: { display: SX ? 'none' : '' },
						  children:
							M0 && M0.length > 0
							  ? M0.map(function (Mv) {
								  return Object(BG.jsx)('div', {
									id: Mv.id,
									className: 'component-paper cursor-pointer',
									onMouseEnter: Mx,
									onMouseLeave: Mk,
									children: Object(BG.jsxs)('div', {
									  className: 'main-container',
									  children: [
										Object(BG.jsx)('div', {
										  className: 'image',
										  children: Object(BG.jsx)('i', {
											className: 'fas '.concat(
											  Mv.icon,
											  ' fa-w-16 fa-fw fa-3x'
											),
										  }),
										}),
										Object(BG.jsxs)('div', {
										  className: 'details',
										  children: [
											Object(BG.jsx)('div', {
											  className: 'title',
											  children: Object(BG.jsx)(BO.a, {
												style: {
												  color: '#fff',
												  wordBreak: 'break-word',
												},
												variant: 'body2',
												gutterBottom: true,
												children: Mv.name,
											  }),
											}),
											Object(BG.jsx)('div', {
											  className: 'description',
											  children: Object(BG.jsxs)('div', {
												className: 'flex-row',
												children: [
												  Object(BG.jsx)('i', {
													className:
													  'fas fa-dollar-sign fa-w-16 fa-fw fa-1x',
													style: { color: '#476a49' },
												  }),
												  Object(BG.jsxs)('div', {
													className: 'flex-row',
													children: [
													  Object(BG.jsx)('i', {
														className:
														  'fas fa-dollar-sign fa-w-16 fa-fw fa-1x',
														style: {
														  color: '#476a49',
														},
													  }),
													  Object(BG.jsxs)('div', {
														className: 'flex-row',
														children: [
														  Object(BG.jsx)('i', {
															className:
															  'fas fa-dollar-sign fa-w-16 fa-fw fa-1x',
															style: {
															  color: '#476a49',
															},
														  }),
														  Object(BG.jsxs)('div', {
															className: 'flex-row',
															children: [
															  Object(BG.jsx)(
																'i',
																{
																  className:
																	'fas fa-dollar-sign fa-w-16 fa-fw fa-1x',
																  style: {
																	color:
																	  '#476a49',
																  },
																}
															  ),
															  Object(BG.jsx)(
																'div',
																{
																  className:
																	'flex-row',
																  children:
																	Object(
																	  BG.jsx
																	)('i', {
																	  className:
																		'fas fa-dollar-sign fa-w-16 fa-fw fa-1x',
																	  style: {
																		color:
																		  '#4b6278',
																	  },
																	}),
																}
															  ),
															],
														  }),
														],
													  }),
													],
												  }),
												],
											  }),
											}),
										  ],
										}),
										Object(BG.jsx)('div', {
										  className:
											Sv.toString() === Mv.id.toString()
											  ? 'actions actions-show'
											  : 'actions',
										  children: Object(BG.jsx)(Bg.a, {
											title: 'Set GPS',
											placement: 'top',
											sx: {
											  backgroundColor:
												'rgba(97, 97, 97, 0.9)',
											},
											arrow: true,
											children: Object(BG.jsx)('div', {
											  children: Object(BG.jsx)('i', {
												id: Mv.id,
												onClick: function (MZ) {
												  return (function (Mm) {
													Ba('setJobsGps', {
													  id: Mm.currentTarget.id,
													})
												  })(MZ)
												},
												className:
												  'fas fa-map-marked fa-w-16 fa-fw fa-lg',
											  }),
											}),
										  }),
										}),
										Object(BG.jsxs)('div', {
										  className: 'image',
										  children: [
											Object(BG.jsxs)(BO.a, {
											  style: {
												color: '#fff',
												wordBreak: 'break-word',
											  },
											  variant: 'body2',
											  gutterBottom: true,
											  children: [
												Mv.limit,
												Object(BG.jsx)('i', {
												  className:
													'fas fa-people-carry fa-w-16 fa-fw fa-sm',
												  style: { marginLeft: '5px' },
												}),
											  ],
											}),
											Object(BG.jsx)('div', {
											  className: 'image',
											  children: Object(BG.jsxs)(BO.a, {
												style: {
												  color: '#fff',
												  wordBreak: 'break-word',
												},
												variant: 'body2',
												gutterBottom: true,
												children: [
												  Mv.groups.length,
												  Object(BG.jsx)('i', {
													className:
													  'fas fa-user fa-w-16 fa-fw fa-sm',
													style: { marginLeft: '5px' },
												  }),
												],
											  }),
											}),
										  ],
										}),
									  ],
									}),
								  })
								})
							  : Object(BG.jsxs)('div', {
								  className: 'flex-centered',
								  style: {
									padding: '32px',
									flexDirection: 'column',
									textAlign: 'center',
								  },
								  children: [
									Object(BG.jsx)('i', {
									  className:
										'fas fa-frown fa-w-16 fa-fw fa-3x',
									  style: {
										color: '#fff',
										marginBottom: '32px',
									  },
									}),
									Object(BG.jsx)(BO.a, {
									  style: {
										color: '#fff',
										wordBreak: 'break-word',
									  },
									  variant: 'h6',
									  gutterBottom: true,
									  children: 'Nothing Here!',
									}),
								  ],
								}),
						}),
						Object(BG.jsxs)('div', {
						  className: Sc.jobsGroupsWrapper,
						  children: [
							Object(BG.jsxs)('div', {
							  className: Sc.jobsGroupsIdle,
							  style: {
								height: 'fit-content',
								display: SX && !Sd && M4.length > 0 ? '' : 'none',
							  },
							  children: [
								Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
									marginTop: '5px',
								  },
								  variant: 'body1',
								  gutterBottom: true,
								  children: 'Idle',
								}),
								M4 && M4.length > 0
								  ? M4.map(function (Mv) {
									  return Object(BG.jsx)('div', {
										className:
										  'component-paper cursor-pointer',
										children: Object(BG.jsxs)('div', {
										  className: 'main-container',
										  children: [
											Object(BG.jsx)('div', {
											  className: 'image',
											  children: Object(BG.jsx)('i', {
												className:
												  'fas fa-users fa-w-16 fa-fw fa-3x',
											  }),
											}),
											Object(BG.jsxs)('div', {
											  className: 'details',
											  children: [
												Object(BG.jsx)('div', {
												  className: 'title',
												  children: Object(BG.jsx)(BO.a, {
													style: {
													  color: '#fff',
													  wordBreak: 'break-word',
													},
													variant: 'body2',
													gutterBottom: true,
													children: Mv.name,
												  }),
												}),
												Object(BG.jsx)('div', {
												  className: 'description',
												  children: Object(BG.jsx)(
													'div',
													{
													  className: 'flex-row',
													  children: Object(BG.jsx)(
														Bg.a,
														{
														  title:
															'Request to Join',
														  placement: 'top',
														  sx: {
															backgroundColor:
															  'rgba(97, 97, 97, 0.9)',
															fontSize: '1em',
															maxWdith: '1000px',
														  },
														  arrow: true,
														  children: Object(
															BG.jsx
														  )('i', {
															onClick: function () {
															  Ba('joinGroup', {
																id: Mv.id,
															  })
															},
															className:
															  'fas fa-sign-in-alt fa-w-16 fa-fw fa-1x',
														  }),
														}
													  ),
													}
												  ),
												}),
											  ],
											}),
											Object(BG.jsxs)('div', {
											  className: 'details',
											  children: [
												Object(BG.jsx)('div', {
												  className: 'title',
												}),
												Object(BG.jsx)('div', {
												  className: 'description',
												  children: Object(BG.jsxs)(
													'div',
													{
													  className: 'flex-row',
													  style: {
														fontFamily:
														  'Roboto, Helvetica, Arial, sans-serif',
													  },
													  children: [
														Object(BG.jsx)('ul', {
														  className: 'fa-ul',
														  children: Object(
															BG.jsxs
														  )('li', {
															style: {
															  fontSize: '15px',
															},
															children: [
															  Object(BG.jsx)(
																'span',
																{
																  className:
																	'fa-li',
																  children:
																	Object(
																	  BG.jsx
																	)('i', {
																	  className:
																		'fas fa-people-carry fa-w-16 fa-fw fa-sm',
																	}),
																}
															  ),
															  Mv.limit,
															],
														  }),
														}),
														Object(BG.jsx)('ul', {
														  className: 'fa-ul',
														  children: Object(
															BG.jsxs
														  )('li', {
															style: {
															  fontSize: '15px',
															},
															children: [
															  Object(BG.jsx)(
																'span',
																{
																  className:
																	'fa-li',
																  children:
																	Object(
																	  BG.jsx
																	)('i', {
																	  className:
																		'fas fa-user fa-w-16 fa-fw fa-sm',
																	}),
																}
															  ),
															  Mv.members.length,
															],
														  }),
														}),
													  ],
													}
												  ),
												}),
											  ],
											}),
											Object(BG.jsx)('div', {
											  className: 'actions',
											}),
										  ],
										}),
									  })
									})
								  : Object(BG.jsx)(BG.Fragment, {}),
							  ],
							}),
							Object(BG.jsxs)('div', {
							  className: Sc.jobsGroupsBusy,
							  style: {
								display: SX && !Sd && M8.length > 0 ? '' : 'none',
							  },
							  children: [
								Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
									marginTop: '5px',
								  },
								  variant: 'body1',
								  gutterBottom: true,
								  children: 'Busy',
								}),
								M8 && M8.length > 0
								  ? M8.map(function (Mv) {
									  return Object(BG.jsx)('div', {
										className:
										  'component-paper cursor-pointer',
										children: Object(BG.jsxs)('div', {
										  className: 'main-container',
										  children: [
											Object(BG.jsx)('div', {
											  className: 'image',
											  children: Object(BG.jsx)('i', {
												className:
												  'fas fa-users-slash fa-w-16 fa-fw fa-3x',
											  }),
											}),
											Object(BG.jsxs)('div', {
											  className: 'details',
											  children: [
												Object(BG.jsx)('div', {
												  className: 'title',
												  children: Object(BG.jsx)(BO.a, {
													style: {
													  color: '#fff',
													  wordBreak: 'break-word',
													},
													variant: 'body2',
													gutterBottom: true,
													children: Mv.name,
												  }),
												}),
												Object(BG.jsx)('div', {
												  className: 'description',
												  children: Object(BG.jsx)(
													'div',
													{ className: 'flex-row' }
												  ),
												}),
											  ],
											}),
											Object(BG.jsxs)('div', {
											  className: 'details',
											  children: [
												Object(BG.jsx)('div', {
												  className: 'title',
												}),
												Object(BG.jsx)('div', {
												  className: 'description',
												  children: Object(BG.jsxs)(
													'div',
													{
													  className: 'flex-row',
													  style: {
														fontFamily:
														  'Roboto, Helvetica, Arial, sans-serif',
													  },
													  children: [
														Object(BG.jsx)('ul', {
														  className: 'fa-ul',
														  children: Object(
															BG.jsxs
														  )('li', {
															style: {
															  fontSize: '15px',
															},
															children: [
															  Object(BG.jsx)(
																'span',
																{
																  className:
																	'fa-li',
																  children:
																	Object(
																	  BG.jsx
																	)('i', {
																	  className:
																		'fas fa-people-carry fa-w-16 fa-fw fa-sm',
																	}),
																}
															  ),
															  Mv.limit,
															],
														  }),
														}),
														Object(BG.jsx)('ul', {
														  className: 'fa-ul',
														  children: Object(
															BG.jsxs
														  )('li', {
															style: {
															  fontSize: '15px',
															},
															children: [
															  Object(BG.jsx)(
																'span',
																{
																  className:
																	'fa-li',
																  children:
																	Object(
																	  BG.jsx
																	)('i', {
																	  className:
																		'fas fa-user fa-w-16 fa-fw fa-sm',
																	}),
																}
															  ),
															  Mv.members.length,
															],
														  }),
														}),
													  ],
													}
												  ),
												}),
											  ],
											}),
											Object(BG.jsx)('div', {
											  className: 'actions',
											}),
										  ],
										}),
									  })
									})
								  : Object(BG.jsx)(BG.Fragment, {}),
							  ],
							}),
						  ],
						}),
						Object(BG.jsxs)('div', {
						  className: Sc.jobsInGroupWrapper,
						  style: {
							display: SX && Sd && !SC ? '' : 'none',
							top: SR ? '3vh' : '2vh',
						  },
						  children: [
							Object(BG.jsx)('div', {
							  className: Sc.waitingForActivity,
							  style: {
								display: SX && Sd && SR && !SC ? '' : 'none',
							  },
							  children: Object(BG.jsxs)('div', {
								className: 'component-ripple-effect',
								children: [
								  Object(BG.jsxs)('div', {
									className: 'lds-ripple',
									style: { marginLeft: '20%' },
									children: [
									  Object(BG.jsx)('div', {}),
									  Object(BG.jsx)('div', {}),
									],
								  }),
								  Object(BG.jsx)(BO.a, {
									style: {
									  color: '#fff',
									  wordBreak: 'break-word',
									},
									variant: 'body1',
									gutterBottom: true,
									children: 'Waiting for Job...',
								  }),
								],
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: Sc.jobsInGroupLeader,
							  style: {
								height: 'fit-content',
								display: SX && Sd && !SC ? '' : 'none',
							  },
							  children: [
								Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
									marginTop: '5px',
								  },
								  variant: 'body1',
								  gutterBottom: true,
								  children: 'Members',
								}),
								MS && MS.length > 0
								  ? MS.map(function (Mv) {
									  return Object(BG.jsx)('div', {
										id: Mv.src,
										className:
										  'component-paper cursor-pointer',
										onMouseEnter: Mx,
										onMouseLeave: Mk,
										children: Object(BG.jsxs)('div', {
										  className: 'main-container',
										  children: [
											Object(BG.jsx)('div', {
											  className: 'image',
											  children: Object(BG.jsx)('i', {
												className: 'fas '.concat(
												  Number(Mv.src) === Number(MT)
													? 'fa-user-graduate'
													: 'fa-user',
												  ' fa-w-16 fa-fw fa-3x'
												),
											  }),
											}),
											Object(BG.jsxs)('div', {
											  className: 'details',
											  children: [
												Object(BG.jsx)('div', {
												  className: 'title',
												  children: Object(BG.jsx)(BO.a, {
													style: {
													  color: '#fff',
													  wordBreak: 'break-word',
													},
													variant: 'body2',
													gutterBottom: true,
													children: Mv.name,
												  }),
												}),
												Object(BG.jsx)('div', {
												  className: 'description',
												  children: Object(BG.jsx)(
													'div',
													{
													  className: 'flex-row',
													  children: Object(BG.jsx)(
														BO.a,
														{
														  style: {
															color: '#fff',
															wordBreak:
															  'break-word',
														  },
														  variant: 'body2',
														  gutterBottom: true,
														  children:
															Number(Mv.src) ===
															Number(MT)
															  ? 'Leader'
															  : 'Member',
														}
													  ),
													}
												  ),
												}),
											  ],
											}),
											Object(BG.jsx)('div', {
											  className:
												Sv.toString() ===
												  Mv.src.toString() &&
												Number(MT) === Number(Mu) &&
												Number(MT) !== Number(Mv.src)
												  ? 'actions actions-show'
												  : 'actions',
											  children: Object(BG.jsx)(Bg.a, {
												title: 'Kick Member',
												placement: 'top',
												sx: {
												  backgroundColor:
													'rgba(97, 97, 97, 0.9)',
												},
												arrow: true,
												children: Object(BG.jsx)('div', {
												  children: Object(BG.jsx)('i', {
													onClick: function () {
													  return (
														(MP = Mv.src),
														void Ba('kickGroup', {
														  id: Mn,
														  src: MP,
														})
													  )
													  var MP
													},
													className:
													  'fas fa-user-times fa-w-16 fa-fw fa-lg',
												  }),
												}),
											  }),
											}),
										  ],
										}),
									  })
									})
								  : Object(BG.jsx)(BG.Fragment, {}),
							  ],
							}),
						  ],
						}),
						Object(BG.jsxs)('div', {
						  className: Sc.jobsInGroupButtons,
						  style: { display: Sd && !SC ? '' : 'none' },
						  children: [
							Object(BG.jsxs)(BW.a, {
							  direction: 'column',
							  spacing: 2,
							  style: {
								display: Number(MT) === Number(Mu) ? '' : 'none',
								whiteSpace: 'nowrap',
							  },
							  children: [
								Object(BG.jsx)(Bk.a, {
								  onClick: function () {
									Ba('readyGroup', { id: Mn })
								  },
								  size: 'small',
								  color: 'success',
								  variant: 'contained',
								  children: SR
									? 'Unready for Jobs'
									: 'Ready for Jobs',
								}),
								Object(BG.jsx)(Bk.a, {
								  onClick: function () {
									Ba('disbandGroup', { id: Mn })
								  },
								  size: 'small',
								  color: 'success',
								  variant: 'contained',
								  children: 'Disband Group',
								}),
							  ],
							}),
							Object(BG.jsx)(BW.a, {
							  direction: 'column',
							  spacing: 2,
							  style: {
								display: Number(MT) !== Number(Mu) ? '' : 'none',
								marginTop: '42%',
							  },
							  children: Object(BG.jsx)(Bk.a, {
								onClick: function () {
								  Ba('leaveGroup', { id: Mn })
								},
								size: 'small',
								color: 'success',
								variant: 'contained',
								children: 'Leave Group',
							  }),
							}),
						  ],
						}),
						Object(BG.jsxs)('div', {
						  className: 'activity-container',
						  style: { display: SX && Sd && SC ? '' : 'none' },
						  children: [
							Object(BG.jsxs)('div', {
							  className: 'activity-title',
							  style: {
								width: '95%',
								marginLeft: '2.5%',
							  },
							  children: [
								Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
								  },
								  variant: 'body2',
								  gutterBottom: true,
								  children: Mw,
								}),
								Object(BG.jsx)('div', {
								  className: 'timer',
								  children: Object(BG.jsx)(BO.a, {
									style: {
									  color: '#fff',
									  wordBreak: 'break-word',
									},
									variant: 'body2',
									gutterBottom: true,
									children: '00:00:00',
								  }),
								}),
							  ],
							}),
							Object(BG.jsx)('div', {
							  className: 'task-list',
							  children: Object(BG.jsx)('div', {
								className: 'activity-task-paper-wrapper',
								style: { marginLeft: '2.5%' },
								children:
								  Ms && Ms.length > 0
									? Ms.map(function (Mv) {
										return Object(BG.jsx)('div', {
										  className: 'activity-task-wrapper',
										  children: Object(BG.jsx)(iJ.a, {
											children: Object(BG.jsxs)(iC.a, {
											  children: [
												Object(BG.jsxs)(iE.a, {
												  children: [
													Object(BG.jsx)(S0.a, {
													  color: 'secondary',
													}),
													Object(BG.jsx)(iU.a, {
													  sx: {
														backgroundColor:
														  Mv.completed
															? 'rgb(66, 76, 171)'
															: 'rgb(189, 189, 189)',
													  },
													}),
												  ],
												}),
												Object(BG.jsx)(iW.a, {
												  children: Object(BG.jsx)(
													'div',
													{
													  className:
														'component-paper cursor-pointer',
													  style: { width: '94.6%' },
													  children: Object(BG.jsxs)(
														'div',
														{
														  className:
															'main-container',
														  children: [
															Object(BG.jsxs)(
															  'div',
															  {
																className:
																  'details',
																children: [
																  Object(BG.jsx)(
																	'div',
																	{
																	  className:
																		'description',
																	  children:
																		Object(
																		  BG.jsx
																		)('div', {
																		  className:
																			'flex-row',
																		  children:
																			Object(
																			  BG.jsx
																			)(
																			  BO.a,
																			  {
																				style:
																				  {
																					color:
																					  '#fff',
																					wordBreak:
																					  'break-word',
																					textDecoration:
																					  Mv.completed
																						? 'line-through'
																						: 'none',
																				  },
																				variant:
																				  'body2',
																				gutterBottom:
																				  true,
																				children:
																				  Mv.task,
																			  }
																			),
																		}),
																	}
																  ),
																  Object(BG.jsx)(
																	'div',
																	{
																	  className:
																		'description',
																	  children:
																		Object(
																		  BG.jsx
																		)('div', {
																		  className:
																			'flex-row',
																		  style: {
																			justifyContent:
																			  'flex-end',
																		  },
																		  children:
																			Object(
																			  BG.jsx
																			)(
																			  BO.a,
																			  {
																				style:
																				  {
																					color:
																					  '#fff',
																					wordBreak:
																					  'break-word',
																				  },
																				variant:
																				  'body1',
																				gutterBottom:
																				  true,
																				children:
																				  Mv.completed
																					? '1/1'
																					: '0/1',
																			  }
																			),
																		}),
																	}
																  ),
																],
															  }
															),
															Object(BG.jsx)(
															  'div',
															  {
																className:
																  'actions',
															  }
															),
														  ],
														}
													  ),
													}
												  ),
												}),
											  ],
											}),
										  }),
										})
									  })
									: Object(BG.jsx)(BG.Fragment, {}),
							  }),
							}),
						  ],
						}),
					  ],
					}),
				  }),
				}),
			  })
			)
		  },
		  S3 = Object(i4.a)({
			darkmarketConfirmModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			darkmarketConfirmModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
		  }),
		  S4 = function () {
			{
			  var Sc = S3(),
				Sx = Object(BP.c)(BZ),
				Sk = Object(B9.a)(Sx, 2),
				Sv = Sk[0],
				SP = Sk[1],
				SZ = Object(B4.useState)([]),
				SV = Object(B9.a)(SZ, 2),
				Sm = SV[0],
				SY = SV[1],
				Sz = Object(B4.useState)([]),
				SF = Object(B9.a)(Sz, 2),
				SX = SF[0],
				SD = SF[1],
				Sr = Object(B4.useState)(0),
				Sl = Object(B9.a)(Sr, 2),
				Sd = Sl[0],
				Sj = Sl[1],
				SH = Object(B4.useState)(false),
				SI = Object(B9.a)(SH, 2),
				SR = SI[0],
				SA = SI[1],
				SL = Object(B4.useState)(false),
				SJ = Object(B9.a)(SL, 2),
				SC = SJ[0],
				SE = SJ[1],
				SU = Object(B4.useState)(false),
				SW = Object(B9.a)(SU, 2),
				M0 = SW[0],
				M1 = SW[1],
				M2 = Object(B4.useState)(false),
				M3 = Object(B9.a)(M2, 2),
				M4 = M3[0],
				M5 = M3[1],
				M6 = Object(B4.useState)(false),
				M7 = Object(B9.a)(M6, 2),
				M8 = (M7[0], M7[1]),
				M9 = Object(B4.useState)(''),
				MB = Object(B9.a)(M9, 2),
				Mi = (MB[0], MB[1])
			  Object(B4.useEffect)(function () {
				Ba('getDarkmarketData', {}).then(function (Ms) {
				  SY(Ms)
				  SD(Ms)
				})
			  }, [])
			  var MS = function (Ma) {
				  SP(Ma.currentTarget.id)
				},
				MM = function () {
				  SP('')
				},
				Mp = function (Ma) {
				  Sj(Ma.currentTarget.id)
				  SA(true)
				}
			  return (
				Bi('closeApps', function () {
				  SA(false)
				  SE(false)
				  M1(false)
				  M5(false)
				  M8(false)
				  Mi('')
				}),
				Object(BG.jsxs)(BG.Fragment, {
				  children: [
					Object(BG.jsx)('div', {
					  className: Sc.darkmarketConfirmModalContainer,
					  style: { display: SR ? '' : 'none' },
					  children: Object(BG.jsxs)('div', {
						className: Sc.darkmarketConfirmModalInnerContainer,
						children: [
						  Object(BG.jsx)('div', {
							className: 'spinner-wrapper',
							style: { display: SC ? '' : 'none' },
							children: Object(BG.jsxs)('div', {
							  className: 'lds-spinner',
							  children: [
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
								Object(BG.jsx)('div', {}),
							  ],
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'spinner-wrapper',
							style: { display: M0 ? '' : 'none' },
							children: Object(BG.jsx)(Bv.Checkmark, {
							  size: '56px',
							  color: '#009688',
							}),
						  }),
						  Object(BG.jsxs)('div', {
							className: 'component-simple-form',
							style: { display: M4 ? 'none' : '' },
							children: [
							  Object(BG.jsx)('div', {
								style: { justifyContent: 'center' },
								children: Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
								  },
								  variant: 'body1',
								  gutterBottom: true,
								  children: 'Confirm purchase',
								}),
							  }),
							  Object(BG.jsxs)('div', {
								className: 'buttons',
								children: [
								  Object(BG.jsx)('div', {
									children: Object(BG.jsx)(Bk.a, {
									  onClick: function () {
										SA(false)
									  },
									  size: 'small',
									  color: 'warning',
									  variant: 'contained',
									  children: 'Cancel',
									}),
								  }),
								  Object(BG.jsx)('div', {
									children: Object(BG.jsx)(Bk.a, {
									  onClick: function () {
										SE(true)
										M5(true)
										Ba('purchaseProduct', { id: Sd }).then(
										  function (Ms) {
											true === Ms.success
											  ? setTimeout(function () {
												  SE(false)
												  M1(true)
												  setTimeout(function () {
													M1(false)
													SA(false)
													M5(false)
												  }, 1500)
												}, 500)
											  : (SE(false),
												M5(false),
												Mi(Ms.message),
												M8(true))
										  }
										)
									  },
									  size: 'small',
									  color: 'success',
									  variant: 'contained',
									  children: 'Submit',
									}),
								  }),
								],
							  }),
							],
						  }),
						],
					  }),
					}),
					Object(BG.jsx)(is, {
					  emptyMessage: 0 === SX.length,
					  primaryActions: [],
					  search: {
						filter: ['product_name', 'product_price'],
						list: Sm,
						onChange: SD,
					  },
					  children:
						SX && SX.length > 0
						  ? SX.map(function (Ma) {
							  return Object(BG.jsx)(
								'div',
								{
								  id: Ma.id,
								  className: 'component-paper cursor-pointer',
								  onMouseEnter: MS,
								  onMouseLeave: MM,
								  children: Object(BG.jsxs)('div', {
									className: 'main-container',
									children: [
									  Object(BG.jsx)('div', {
										className: 'image',
										children: Object(BG.jsx)('i', {
										  className: 'fas '.concat(
											Ma.product_icon,
											' fa-w-16 fa-fw fa-3x'
										  ),
										}),
									  }),
									  Object(BG.jsxs)('div', {
										className: 'details',
										children: [
										  Object(BG.jsx)('div', {
											className: 'title',
											children: Object(BG.jsx)(BO.a, {
											  style: {
												color: '#fff',
												wordBreak: 'break-word',
											  },
											  variant: 'body2',
											  gutterBottom: true,
											  children: Ma.product_name,
											}),
										  }),
										  Object(BG.jsx)('div', {
											className: 'description',
											children: Object(BG.jsx)('div', {
											  className: 'flex-row',
											  children: Object(BG.jsxs)(BO.a, {
												style: {
												  color: '#fff',
												  wordBreak: 'break-word',
												},
												variant: 'body2',
												gutterBottom: true,
												children: [
												  Ma.product_price,
												  ' ',
												  1 === Ma.cryptoid
													? 'SHUNGITE'
													: 'GUINEA',
												],
											  }),
											}),
										  }),
										],
									  }),
									  Object(BG.jsx)('div', {
										className:
										  Sv.toString() === Ma.id.toString()
											? 'actions actions-show'
											: 'actions',
										children: Object(BG.jsx)(Bg.a, {
										  title: 'Buy Product',
										  placement: 'top',
										  sx: {
											backgroundColor:
											  'rgba(97, 97, 97, 0.9)',
										  },
										  arrow: true,
										  children: Object(BG.jsx)('div', {
											children: Object(BG.jsx)('i', {
											  onClick: Mp,
											  id: Ma.id,
											  className:
												'fas fa-hand-holding-usd fa-w-16 fa-fw fa-lg',
											}),
										  }),
										}),
									  }),
									],
								  }),
								},
								Ma.id
							  )
							})
						  : Object(BG.jsx)(BG.Fragment, {}),
					}),
				  ],
				})
			  )
			}
		  },
		  S5 = function () {
			var Sc = Object(B4.useState)([]),
			  Sx = Object(B9.a)(Sc, 2),
			  Sk = Sx[0],
			  Sv = Sx[1],
			  SP = Object(B4.useState)([]),
			  SZ = Object(B9.a)(SP, 2),
			  SV = SZ[0],
			  Sm = SZ[1]
			return (
			  Object(B4.useEffect)(function () {
				Ba('getEmploymentData', {}).then(function (SY) {
				  Sv(SY)
				  Sm(SY)
				})
			  }, []),
			  Bi('closeApps', function () {}),
			  Object(BG.jsx)(BG.Fragment, {
				children: Object(BG.jsx)(is, {
				  emptyMessage: 0 === SV.length,
				  primaryActions: [],
				  search: {
					filter: ['businessname'],
					list: Sk,
					onChange: Sm,
				  },
				  children:
					SV && SV.length > 0
					  ? SV.map(function (SY, Sz) {
						  return Object(BG.jsx)(Bq.b, {
							to: '/employees/'.concat(SY.businessid),
							style: {
							  color: '#fff',
							  textDecoration: 'none',
							},
							children: Object(BG.jsx)(
							  'div',
							  {
								id: SY.id,
								className: 'component-paper cursor-pointer',
								children: Object(BG.jsxs)('div', {
								  className: 'main-container',
								  children: [
									Object(BG.jsx)('div', {
									  className: 'image',
									  children: Object(BG.jsx)('i', {
										className:
										  'fas fa-business-time fa-w-16 fa-fw fa-3x',
									  }),
									}),
									Object(BG.jsxs)('div', {
									  className: 'details',
									  children: [
										Object(BG.jsx)('div', {
										  className: 'title',
										  children: Object(BG.jsx)(BO.a, {
											style: {
											  color: '#fff',
											  wordBreak: 'break-word',
											},
											variant: 'body2',
											gutterBottom: true,
											children: SY.businessname,
										  }),
										}),
										Object(BG.jsx)('div', {
										  className: 'description',
										  children: Object(BG.jsx)('div', {
											className: 'flex-row',
											children: Object(BG.jsx)(BO.a, {
											  style: {
												color: '#fff',
												wordBreak: 'break-word',
											  },
											  variant: 'body2',
											  gutterBottom: true,
											  children: SY.businessrole,
											}),
										  }),
										}),
									  ],
									}),
									Object(BG.jsx)('div', {
									  className: 'actions',
									}),
								  ],
								}),
							  },
							  SY.id
							),
						  })
						})
					  : Object(BG.jsx)(BG.Fragment, {}),
				}),
			  })
			)
		  },
		  S6 = B2(133),
		  S7 = Object(i4.a)({
			root: {
			  top: '0px',
			  left: '0px',
			  width: '100vw',
			  height: '100vh',
			  position: 'absolute',
			  maxWidth: '100vw',
			  minWidth: '100vw',
			  maxHeight: '100vh',
			  minHeight: '100vh',
			  pointerEvents: 'none',
			  border: '0px',
			  margin: '0px',
			  outline: '0px',
			  padding: '0px',
			  overflow: 'hidden',
			  '& .MuiInput-root': {
				color: 'white',
				fontSize: '1.3vmin',
			  },
			  '& .MuiInput-underline:hover:not(.Mui-disabled):before': {
				borderColor: 'darkgray',
			  },
			  '& .MuiInput-underline:before': {
				borderColor: 'darkgray',
				color: 'darkgray',
			  },
			  '& .MuiInput-underline:after': {
				borderColor: 'white',
				color: 'darkgray',
			  },
			  '& .MuiInputLabel-animated': {
				color: 'darkgray',
				fontSize: '1.5vmin',
			  },
			  '& .MuiInputAdornment-root': { color: 'darkgray' },
			  '& label.Mui-focused': { color: 'darkgray' },
			},
			input: {
			  '& input[type=number]': { '-moz-appearance': 'textfield' },
			  '& input[type=number]::-webkit-outer-spin-button': {
				'-webkit-appearance': 'none',
				margin: 0,
			  },
			  '& input[type=number]::-webkit-inner-spin-button': {
				'-webkit-appearance': 'none',
				margin: 0,
			  },
			},
			employeesOuterContainer: {
			  width: '100%',
			  height: '100%',
			  overflow: 'hidden',
			  position: 'absolute',
			  bottom: '0%',
			  opacity: '1',
			},
			employeesInnerContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  position: 'absolute',
			  transition: 'all 400ms ease 0s',
			  willChange: 'left',
			},
			employeesSearch: {
			  width: '100%',
			  height: '64px',
			  display: 'flex',
			  padding: '8px 16px',
			  position: 'relative',
			  marginBottom: '8px',
			},
			employeesSearchWrapper: {
			  width: '100%',
			  position: 'relative',
			},
			employeesIcon: {
			  top: '32px',
			  right: '16px',
			  display: 'flex',
			  zIndex: '1',
			  position: 'absolute',
			  justifyContent: 'flex-end',
			},
			employeesIconWrapper: {
			  color: '#fff',
			  marginLeft: '16px',
			},
			employeesEmployees: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  overflow: 'hidden scroll',
			  maxHeight: 'calc(100% - 72px)',
			  minHeight: 'calc(100% - 72px)',
			},
			employeeEditEmployeeModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			employeeEditEmployeeModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
			employeeHireEmployeeModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			employeeHireEmployeeModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
			employeeChargeCustomerModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			employeeChargeCustomerModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
			employeeDeleteRoleModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			employeeDeleteRoleModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
			employeeCreateRoleModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			employeeCreateRoleModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
			employeeEditRoleModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			employeeEditRoleModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
		  }),
		  S8 = function () {
			var Sc = S7(),
			  Sx = Object(BP.c)(BZ),
			  Sk = Object(B9.a)(Sx, 2),
			  Sv = Sk[0],
			  SP = Sk[1],
			  SZ = Object(B4.useState)([]),
			  SV = Object(B9.a)(SZ, 2),
			  Sm = SV[0],
			  SY = SV[1],
			  Sz = Object(B4.useState)([]),
			  SF = Object(B9.a)(Sz, 2),
			  SX = SF[0],
			  SD = SF[1],
			  Sr = Object(B4.useState)({
				roleManage: false,
				roleCreate: false,
				canHire: false,
				canFire: false,
				canCharge: false,
			  }),
			  Sl = Object(B9.a)(Sr, 2),
			  Sd = Sl[0],
			  Sj = Sl[1],
			  SH = Object(B4.useState)([]),
			  SI = Object(B9.a)(SH, 2),
			  SR = SI[0],
			  SA = SI[1],
			  SL = Object(B4.useState)(false),
			  SJ = Object(B9.a)(SL, 2),
			  SC = SJ[0],
			  SE = SJ[1],
			  SU = Object(B4.useState)(false),
			  SW = Object(B9.a)(SU, 2),
			  M0 = SW[0],
			  M1 = SW[1],
			  M2 = Object(B4.useState)(false),
			  M3 = Object(B9.a)(M2, 2),
			  M4 = M3[0],
			  M5 = M3[1],
			  M6 = Object(B4.useState)(false),
			  M7 = Object(B9.a)(M6, 2),
			  M8 = M7[0],
			  M9 = M7[1],
			  MB = Object(B4.useState)(false),
			  Mi = Object(B9.a)(MB, 2),
			  MS = Mi[0],
			  MM = Mi[1],
			  Mp = Object(B4.useState)(false),
			  Ma = Object(B9.a)(Mp, 2),
			  Ms = Ma[0],
			  Mo = Ma[1],
			  MQ = Object(B4.useState)(false),
			  MO = Object(B9.a)(MQ, 2),
			  Mn = MO[0],
			  MK = MO[1],
			  Mb = Object(B4.useState)(false),
			  Mg = Object(B9.a)(Mb, 2),
			  MT = Mg[0],
			  MN = Mg[1],
			  MG = Object(B4.useState)(false),
			  My = Object(B9.a)(MG, 2),
			  Mu = My[0],
			  Mf = My[1],
			  Mh = Object(B4.useState)(false),
			  Mq = Object(B9.a)(Mh, 2),
			  Mw = Mq[0],
			  Mc = Mq[1],
			  Mx = Object(B4.useState)(false),
			  Mk = Object(B9.a)(Mx, 2),
			  Mv = Mk[0],
			  MP = Mk[1],
			  MZ = Object(B4.useState)(false),
			  MV = Object(B9.a)(MZ, 2),
			  Mm = MV[0],
			  MY = MV[1],
			  Mz = Object(B4.useState)(false),
			  MF = Object(B9.a)(Mz, 2),
			  MX = MF[0],
			  MD = MF[1],
			  Mr = Object(B4.useState)(false),
			  Ml = Object(B9.a)(Mr, 2),
			  Md = Ml[0],
			  Mj = Ml[1],
			  MH = Object(B4.useState)(false),
			  MI = Object(B9.a)(MH, 2),
			  MR = MI[0],
			  MA = MI[1],
			  ML = Object(B4.useState)(false),
			  MJ = Object(B9.a)(ML, 2),
			  MC = MJ[0],
			  ME = MJ[1],
			  MU = Object(B4.useState)(false),
			  MW = Object(B9.a)(MU, 2),
			  p0 = MW[0],
			  p1 = MW[1],
			  p2 = Object(B4.useState)(false),
			  p3 = Object(B9.a)(p2, 2),
			  p4 = p3[0],
			  p5 = p3[1],
			  p6 = Object(B4.useState)(false),
			  p7 = Object(B9.a)(p6, 2),
			  p8 = p7[0],
			  p9 = p7[1],
			  pB = Object(B4.useState)(''),
			  pi = Object(B9.a)(pB, 2),
			  pS = pi[0],
			  pM = pi[1],
			  pp = Object(B4.useState)(''),
			  ps = Object(B9.a)(pp, 2),
			  po = ps[0],
			  pQ = ps[1],
			  pO = Object(B4.useState)(''),
			  pn = Object(B9.a)(pO, 2),
			  pK = pn[0],
			  pb = pn[1],
			  pg = Object(B4.useState)(0),
			  pT = Object(B9.a)(pg, 2),
			  pN = pT[0],
			  pG = pT[1],
			  py = Object(B4.useState)(0),
			  pu = Object(B9.a)(py, 2),
			  pf = pu[0],
			  ph = pu[1],
			  pq = Object(B4.useState)(''),
			  pw = Object(B9.a)(pq, 2),
			  pc = pw[0],
			  px = pw[1],
			  pk = Object(B4.useState)(''),
			  pv = Object(B9.a)(pk, 2),
			  pP = pv[0],
			  pZ = pv[1],
			  pV = Object(B4.useState)(''),
			  pm = Object(B9.a)(pV, 2),
			  pY = (pm[0], pm[1]),
			  pz = Object(B4.useState)(''),
			  pF = Object(B9.a)(pz, 2),
			  pX = pF[0],
			  pD = pF[1],
			  pr = Object(B4.useState)(0),
			  pl = Object(B9.a)(pr, 2),
			  pd = pl[0],
			  pj = pl[1],
			  pH = Object(BQ.g)().businessId,
			  pI = B5.a.useState(null),
			  pR = Object(B9.a)(pI, 2),
			  pA = pR[0],
			  pL = pR[1],
			  pJ = Boolean(pA)
			Object(B4.useEffect)(
			  function () {
				Ba('getEmployeesData', { id: pH }).then(function (aM) {
				  SY(aM.employees)
				  SD(aM.employees)
				  SA(aM.roles)
				  pj(aM.cid)
				  Sj(aM.permission)
				})
			  },
			  [pH]
			)
			var pC = function (aM) {
				MK(aM.target.checked)
			  },
			  pE = function (aM) {
				MN(aM.target.checked)
			  },
			  pU = function (aM) {
				Mf(aM.target.checked)
			  },
			  pW = function (aM) {
				Mc(aM.target.checked)
			  },
			  a0 = function (aM) {
				MP(aM.target.checked)
			  },
			  a1 = function (aM) {
				MY(aM.target.checked)
			  },
			  a2 = function (aM) {
				MD(aM.target.checked)
			  },
			  a3 = function (aM) {
				Mj(aM.target.checked)
			  },
			  a4 = function (aM) {
				MA(aM.target.checked)
			  },
			  a5 = function (aM) {
				ME(aM.target.checked)
			  },
			  a6 = function (aM) {
				pM(aM.currentTarget.id)
				SE(true)
			  },
			  a7 = function (aM) {
				Ba('removeEmployee', {
				  id: aM.currentTarget.id,
				  businessid: pH,
				}).then(function (as) {
				  SY(as.employees)
				  SD(as.employees)
				  SA(as.roles)
				  pj(as.cid)
				})
			  },
			  a8 = function (aM) {
				pQ(aM.currentTarget.id)
			  },
			  a9 = function (aM) {
				SP(aM.currentTarget.id)
			  },
			  aB = function (aM) {
				pD(aM.target.value)
			  },
			  ai = function () {
				SP('')
			  },
			  aS = Object(BQ.f)()
			return (
			  Bi('closeApps', function () {
				p1(false)
				p5(false)
				p9(false)
				SE(false)
				M1(false)
				M5(false)
				M9(false)
				MM(false)
				Mo(false)
				MK(false)
				MN(false)
				Mf(false)
				Mc(false)
				MP(false)
				MY(false)
				MD(false)
				Mj(false)
				MA(false)
				ME(false)
				pL(null)
				pM('')
				pQ('')
				pD('')
				pb('')
				pG(0)
				ph(0)
				px('')
				pZ('')
				pY('Owner')
			  }),
			  Object(BG.jsxs)(BG.Fragment, {
				children: [
				  Object(BG.jsx)('div', {
					className: Sc.employeeEditEmployeeModalContainer,
					style: { display: SC ? '' : 'none' },
					children: Object(BG.jsxs)('div', {
					  className: Sc.employeeEditEmployeeModalInnerContainer,
					  children: [
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: p0 ? '' : 'none' },
						  children: Object(BG.jsxs)('div', {
							className: 'lds-spinner',
							children: [
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: p4 ? '' : 'none' },
						  children: Object(BG.jsx)(Bv.Checkmark, {
							size: '56px',
							color: '#009688',
						  }),
						}),
						Object(BG.jsxs)('div', {
						  className: 'component-simple-form',
						  style: { display: p0 || p8 ? 'none' : '' },
						  children: [
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'State ID',
									variant: 'standard',
									value: pS,
									InputProps: {
									  readOnly: true,
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)('i', {
										  className: 'fas fa-id-card',
										}),
									  }),
									},
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Role',
									variant: 'standard',
									defaultValue: po,
									onChange: aB,
									select: true,
									children: SR.map(function (aM, ap) {
									  aM.value
									  var as = aM.label
									  return Object(BG.jsx)(
										iP.a,
										{
										  value: as,
										  children: as,
										},
										as
									  )
									}),
								  }),
								}),
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: 'buttons',
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  SE(false)
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Cancel',
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  p1(true)
									  p9(true)
									  Ba('editEmployee', {
										id: pS,
										businessid: pH,
										role: pX,
									  }).then(function (ap) {
										SY(ap.employees)
										SD(ap.employees)
										SA(ap.roles)
										pj(ap.cid)
										p1(false)
										p5(true)
										setTimeout(function () {
										  p5(false)
										  SE(false)
										  p9(false)
										}, 1000)
									  })
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Submit',
								  }),
								}),
							  ],
							}),
						  ],
						}),
					  ],
					}),
				  }),
				  Object(BG.jsx)('div', {
					className: Sc.employeeHireEmployeeModalContainer,
					style: { display: M0 ? '' : 'none' },
					children: Object(BG.jsxs)('div', {
					  className: Sc.employeeHireEmployeeModalInnerContainer,
					  children: [
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: p0 ? '' : 'none' },
						  children: Object(BG.jsxs)('div', {
							className: 'lds-spinner',
							children: [
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: p4 ? '' : 'none' },
						  children: Object(BG.jsx)(Bv.Checkmark, {
							size: '56px',
							color: '#009688',
						  }),
						}),
						Object(BG.jsxs)('div', {
						  className: 'component-simple-form',
						  style: { display: p0 || p8 ? 'none' : '' },
						  children: [
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									className: Sc.input,
									id: 'input-with-icon-textfield',
									type: 'number',
									label: 'State ID',
									variant: 'standard',
									onChange: function (aM) {
									  pb(aM.target.value)
									},
									value: pK,
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)('i', {
										  className: 'fas fa-id-card',
										}),
									  }),
									},
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Role',
									variant: 'standard',
									onChange: aB,
									select: true,
									children: SR.map(function (aM, ap) {
									  aM.value
									  var as = aM.label
									  return Object(BG.jsx)(
										iP.a,
										{
										  value: as,
										  children: as,
										},
										as
									  )
									}),
								  }),
								}),
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: 'buttons',
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  M1(false)
									  pb('')
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Cancel',
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  p1(true)
									  p9(true)
									  Ba('hireEmployee', {
										id: pK,
										businessid: pH,
										role: pX,
									  }).then(function (aM) {
										SY(aM.employees)
										SD(aM.employees)
										SA(aM.roles)
										pj(aM.cid)
										p1(false)
										p5(true)
										setTimeout(function () {
										  p5(false)
										  M1(false)
										  p9(false)
										}, 1000)
									  })
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Submit',
								  }),
								}),
							  ],
							}),
						  ],
						}),
					  ],
					}),
				  }),
				  Object(BG.jsx)('div', {
					className: Sc.employeeChargeCustomerModalContainer,
					style: { display: M4 ? '' : 'none' },
					children: Object(BG.jsxs)('div', {
					  className: Sc.employeeChargeCustomerModalInnerContainer,
					  children: [
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: p0 ? '' : 'none' },
						  children: Object(BG.jsxs)('div', {
							className: 'lds-spinner',
							children: [
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: p4 ? '' : 'none' },
						  children: Object(BG.jsx)(Bv.Checkmark, {
							size: '56px',
							color: '#009688',
						  }),
						}),
						Object(BG.jsxs)('div', {
						  className: 'component-simple-form',
						  style: { display: p0 || p8 ? 'none' : '' },
						  children: [
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									className: Sc.input,
									id: 'input-with-icon-textfield',
									type: 'number',
									label: 'State ID',
									variant: 'standard',
									onChange: function (aM) {
									  pG(aM.target.value)
									},
									value: pN,
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)('i', {
										  className: 'fas fa-id-card',
										}),
									  }),
									},
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									className: Sc.input,
									id: 'input-with-icon-textfield',
									type: 'number',
									label: 'Amount',
									variant: 'standard',
									onChange: function (aM) {
									  ph(aM.target.value)
									},
									value: pf,
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)('i', {
										  className: 'fas fa-dollar-sign',
										}),
									  }),
									},
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)(Bw.a, {
								fullWidth: true,
								sx: { width: '100%' },
								children: Object(BG.jsx)(Bc.a, {
								  multiline: true,
								  rows: 2,
								  id: 'input-with-icon-textfield',
								  label: 'Comment',
								  variant: 'standard',
								  onChange: function (aM) {
									px(aM.target.value)
								  },
								  value: pc,
								}),
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: 'buttons',
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  M5(false)
									  pG(0)
									  ph(0)
									  px('')
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Cancel',
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  p1(true)
									  p9(true)
									  Ba('chargeCustomer', {
										id: pN,
										businessid: pH,
										amount: pf,
										comment: pc,
									  }).then(function (ap) {
										p1(false)
										p5(true)
										pG(0)
										ph(0)
										px('')
										setTimeout(function () {
										  p5(false)
										  M5(false)
										  p9(false)
										}, 1000)
									  })
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Submit',
								  }),
								}),
							  ],
							}),
						  ],
						}),
					  ],
					}),
				  }),
				  Object(BG.jsx)('div', {
					className: Sc.employeeDeleteRoleModalContainer,
					style: { display: M8 ? '' : 'none' },
					children: Object(BG.jsxs)('div', {
					  className: Sc.employeeDeleteRoleModalInnerContainer,
					  children: [
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: p0 ? '' : 'none' },
						  children: Object(BG.jsxs)('div', {
							className: 'lds-spinner',
							children: [
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: p4 ? '' : 'none' },
						  children: Object(BG.jsx)(Bv.Checkmark, {
							size: '56px',
							color: '#009688',
						  }),
						}),
						Object(BG.jsxs)('div', {
						  className: 'component-simple-form',
						  style: { display: p0 || p8 ? 'none' : '' },
						  children: [
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Role',
									variant: 'standard',
									onChange: aB,
									select: true,
									children: SR.map(function (aM, ap) {
									  aM.value
									  var as = aM.label
									  return Object(BG.jsx)(
										iP.a,
										{
										  value: as,
										  children: as,
										},
										as
									  )
									}),
								  }),
								}),
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: 'buttons',
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  M9(false)
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Cancel',
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  p1(true)
									  p9(true)
									  Ba('deleteRole', {
										businessid: pH,
										role: pX,
									  }).then(function (ap) {
										SY(ap.employees)
										SD(ap.employees)
										SA(ap.roles)
										pj(ap.cid)
										p1(false)
										p5(true)
										setTimeout(function () {
										  p5(false)
										  M9(false)
										  p9(false)
										}, 1000)
									  })
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Submit',
								  }),
								}),
							  ],
							}),
						  ],
						}),
					  ],
					}),
				  }),
				  Object(BG.jsx)('div', {
					className: Sc.employeeCreateRoleModalContainer,
					style: { display: MS ? '' : 'none' },
					children: Object(BG.jsxs)('div', {
					  className: Sc.employeeCreateRoleModalInnerContainer,
					  children: [
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: p0 ? '' : 'none' },
						  children: Object(BG.jsxs)('div', {
							className: 'lds-spinner',
							children: [
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: p4 ? '' : 'none' },
						  children: Object(BG.jsx)(Bv.Checkmark, {
							size: '56px',
							color: '#009688',
						  }),
						}),
						Object(BG.jsxs)('div', {
						  className: 'component-simple-form',
						  style: { display: p0 || p8 ? 'none' : '' },
						  children: [
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Role Name',
									variant: 'standard',
									onChange: function (aM) {
									  pZ(aM.target.value)
									},
									InputProps: {
									  startAdornment: Object(BG.jsx)(Bx.a, {
										position: 'start',
										children: Object(BG.jsx)('i', {
										  className: 'fas fa-tag',
										}),
									  }),
									},
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsxs)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: [
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: Mn,
										onChange: pC,
									  }),
									  label: 'Hire',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: MT,
										onChange: pE,
									  }),
									  label: 'Fire',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: Mu,
										onChange: pU,
									  }),
									  label: 'Change Role',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: Mw,
										onChange: pW,
									  }),
									  label: 'Pay Employee',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: Mv,
										onChange: a0,
									  }),
									  label: 'Pay External',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: Mm,
										onChange: a1,
									  }),
									  label: 'Charge External',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: MX,
										onChange: a2,
									  }),
									  label: 'Property Keys',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: Md,
										onChange: a3,
									  }),
									  label: 'Stash Access',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: MR,
										onChange: a4,
									  }),
									  label: 'Craft Access',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: MC,
										onChange: a5,
									  }),
									  label: 'Bank Access',
									}),
								  ],
								}),
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: 'buttons',
							  style: { marginTop: '0px' },
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  MM(false)
									  pZ('')
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Cancel',
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  p1(true)
									  p9(true)
									  Ba('createRole', {
										businessid: pH,
										role: pP,
										permissions: {
										  hire: Mn,
										  fire: MT,
										  changeRole: Mu,
										  payEmployee: Mw,
										  payExternal: Mv,
										  chargeExternal: Mm,
										  propertyKeys: MX,
										  stash: Md,
										  craft: MR,
										  bank: MC,
										},
									  }).then(function (ap) {
										SY(ap.employees)
										SD(ap.employees)
										SA(ap.roles)
										pj(ap.cid)
										MK(false)
										MN(false)
										Mf(false)
										Mc(false)
										MP(false)
										MY(false)
										MD(false)
										Mj(false)
										MA(false)
										ME(false)
										p1(false)
										p5(true)
										setTimeout(function () {
										  p5(false)
										  MM(false)
										  pZ('')
										  p9(false)
										}, 1000)
									  })
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Submit',
								  }),
								}),
							  ],
							}),
						  ],
						}),
					  ],
					}),
				  }),
				  Object(BG.jsx)('div', {
					className: Sc.employeeEditRoleModalContainer,
					style: { display: Ms ? '' : 'none' },
					children: Object(BG.jsxs)('div', {
					  className: Sc.employeeEditRoleModalInnerContainer,
					  children: [
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: p0 ? '' : 'none' },
						  children: Object(BG.jsxs)('div', {
							className: 'lds-spinner',
							children: [
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: p4 ? '' : 'none' },
						  children: Object(BG.jsx)(Bv.Checkmark, {
							size: '56px',
							color: '#009688',
						  }),
						}),
						Object(BG.jsxs)('div', {
						  className: 'component-simple-form',
						  style: { display: p0 || p8 ? 'none' : '' },
						  children: [
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Role',
									variant: 'standard',
									onChange: function (aM) {
									  pD(aM.target.value)
									  Ba('getRolePermission', {
										businessid: pH,
										role: aM.target.value,
									  }).then(function (as) {
										MK(as.canHire)
										MN(as.canFire)
										Mf(as.roleManage)
										MD(as.hasKeys)
										MY(as.canCharge)
										Mj(as.hasStash)
										MA(as.hasCraft)
										ME(as.hasBank)
									  })
									},
									select: true,
									children: SR.map(function (aM, ap) {
									  {
										aM.value
										var ao = aM.label
										return Object(BG.jsx)(
										  iP.a,
										  {
											value: ao,
											children: ao,
										  },
										  ao
										)
									  }
									}),
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsxs)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: [
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: Mn,
										onChange: pC,
									  }),
									  label: 'Hire',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: MT,
										onChange: pE,
									  }),
									  label: 'Fire',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: Mu,
										onChange: pU,
									  }),
									  label: 'Change Role',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: Mw,
										onChange: pW,
									  }),
									  label: 'Pay Employee',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: Mv,
										onChange: a0,
									  }),
									  label: 'Pay External',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: Mm,
										onChange: a1,
									  }),
									  label: 'Charge External',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: MX,
										onChange: a2,
									  }),
									  label: 'Property Keys',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: Md,
										onChange: a3,
									  }),
									  label: 'Stash Access',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: MR,
										onChange: a4,
									  }),
									  label: 'Craft Access',
									}),
									Object(BG.jsx)(ij.a, {
									  style: { color: '#fff' },
									  control: Object(BG.jsx)(iH.a, {
										color: 'warning',
										checked: MC,
										onChange: a5,
									  }),
									  label: 'Bank Access',
									}),
								  ],
								}),
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: 'buttons',
							  style: { marginTop: '0px' },
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  Mo(false)
									  pY('Owner')
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Cancel',
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  p1(true)
									  p9(true)
									  Ba('editRole', {
										businessid: pH,
										role: pX,
										permissions: {
										  hire: Mn,
										  fire: MT,
										  changeRole: Mu,
										  payEmployee: Mw,
										  payExternal: Mv,
										  chargeExternal: Mm,
										  propertyKeys: MX,
										  stash: Md,
										  craft: MR,
										  bank: MC,
										},
									  }).then(function (aM) {
										SY(aM.employees)
										SD(aM.employees)
										SA(aM.roles)
										pj(aM.cid)
										pY('Owner')
										p1(false)
										p5(true)
										setTimeout(function () {
										  p5(false)
										  Mo(false)
										  p9(false)
										}, 1000)
									  })
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Save',
								  }),
								}),
							  ],
							}),
						  ],
						}),
					  ],
					}),
				  }),
				  Object(BG.jsx)('div', {
					className: Sc.employeesOuterContainer,
					style: { zIndex: 500 },
					children: Object(BG.jsx)('div', {
					  className: Sc.employeesInnerContainer,
					  children: Object(BG.jsxs)('div', {
						className: 'employees-container',
						children: [
						  Object(BG.jsxs)('div', {
							className: Sc.employeesSearch,
							children: [
							  Object(BG.jsx)(Bg.a, {
								title: 'Go Back',
								placement: 'right',
								sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
								arrow: true,
								children: Object(BG.jsx)('div', {
								  style: {
									color: '#fff',
									width: '40px',
									display: 'flex',
									alignItems: 'center',
								  },
								  children: Object(BG.jsx)('i', {
									onClick: function () {
									  aS.push('/employment')
									},
									className:
									  'fas fa-chevron-left fa-w-10 fa-fw fa-lg',
								  }),
								}),
							  }),
							  Object(BG.jsx)('div', {
								className: Sc.employeesSearchWrapper,
								children: Object(BG.jsx)('div', {
								  className: 'input-wrapper',
								  children: Object(BG.jsx)(Bw.a, {
									fullWidth: true,
									sx: { width: '100%' },
									children: Object(BG.jsx)(Bc.a, {
									  id: 'input-with-icon-textfield',
									  label: 'Search',
									  onChange: function (aM) {
										return (function (as) {
										  if ('' !== as) {
											var aQ = Sm.filter(function (aO) {
											  return aO.name
												.toLowerCase()
												.startsWith(as.toLowerCase())
											})
											SD(aQ)
										  } else {
											SD(Sm)
										  }
										})(aM.target.value)
									  },
									  InputProps: {
										startAdornment: Object(BG.jsx)(Bx.a, {
										  position: 'start',
										  children: Object(BG.jsx)(ia.a, {}),
										}),
									  },
									  variant: 'standard',
									}),
								  }),
								}),
							  }),
							],
						  }),
						  Object(BG.jsx)('div', {
							className: Sc.employeesIcon,
							children: Object(BG.jsxs)('div', {
							  className: Sc.employeesIconWrapper,
							  children: [
								Object(BG.jsx)('i', {
								  onClick: function (aM) {
									pL(aM.currentTarget)
								  },
								  style: {
									display:
									  Sd.roleCreate ||
									  Sd.roleManage ||
									  Sd.canHire ||
									  Sd.canCharge
										? ''
										: 'none',
									fontSize: '1.2em',
								  },
								  className:
									'fas fa-ellipsis-v fa-w-16 fa-fw fa-lg',
								}),
								Object(BG.jsxs)(S6.a, {
								  id: 'demo-positioned-menu',
								  'aria-labelledby': 'demo-positioned-button',
								  anchorEl: pA,
								  open: pJ,
								  onClose: function () {
									pL(null)
								  },
								  anchorOrigin: {
									vertical: 'bottom',
									horizontal: 'left',
								  },
								  transformOrigin: {
									vertical: 'top',
									horizontal: 'left',
								  },
								  children: [
									Object(BG.jsxs)(iP.a, {
									  style: {
										display: Sd.canHire ? '' : 'none',
									  },
									  onClick: function () {
										pL(null)
										M1(true)
									  },
									  children: [
										Object(BG.jsx)('i', {
										  className: 'fas fa-user-plus',
										  style: {
											display: Sd.canHire ? '' : 'none',
											marginRight: '5%',
										  },
										}),
										' Hire',
									  ],
									}),
									Object(BG.jsxs)(iP.a, {
									  style: {
										display: Sd.canCharge ? '' : 'none',
									  },
									  onClick: function () {
										pL(null)
										M5(true)
									  },
									  children: [
										Object(BG.jsx)('i', {
										  className: 'fas fa-credit-card',
										  style: {
											display: Sd.canCharge ? '' : 'none',
											marginRight: '5%',
										  },
										}),
										' Charge Customer',
									  ],
									}),
									Object(BG.jsxs)(iP.a, {
									  style: {
										display: Sd.roleCreate ? '' : 'none',
									  },
									  onClick: function () {
										pL(null)
										MM(true)
									  },
									  children: [
										Object(BG.jsx)('i', {
										  className: 'fas fa-user-tag',
										  style: {
											display: Sd.roleCreate ? '' : 'none',
											marginRight: '5%',
										  },
										}),
										' Create Role',
									  ],
									}),
									Object(BG.jsxs)(iP.a, {
									  style: {
										display: Sd.roleManage ? '' : 'none',
									  },
									  onClick: function () {
										pY('Owner')
										pL(null)
										Mo(true)
									  },
									  children: [
										Object(BG.jsx)('i', {
										  className: 'fas fa-user-tag',
										  style: {
											display: Sd.roleManage ? '' : 'none',
											marginRight: '5%',
										  },
										}),
										' Edit Role',
									  ],
									}),
									Object(BG.jsxs)(iP.a, {
									  style: {
										display: Sd.roleManage ? '' : 'none',
									  },
									  onClick: function () {
										pL(null)
										M9(true)
									  },
									  children: [
										Object(BG.jsx)('i', {
										  className: 'fas fa-user-tag',
										  style: {
											display: Sd.roleManage ? '' : 'none',
											marginRight: '5%',
										  },
										}),
										' Delete Role',
									  ],
									}),
								  ],
								}),
							  ],
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: Sc.employeesEmployees,
							children:
							  SX && SX.length > 0
								? SX.sort(function (aM, ap) {
									return Number(ap.rank) - Number(aM.rank)
								  }).map(function (aM, ap) {
									return Object(BG.jsx)(
									  'div',
									  {
										id: aM.id,
										className:
										  'component-paper cursor-pointer',
										onMouseEnter: a9,
										onMouseLeave: ai,
										children: Object(BG.jsxs)('div', {
										  className: 'main-container',
										  children: [
											Object(BG.jsx)('div', {
											  className: 'image',
											  children: Object(BG.jsx)('i', {
												className: 'fas '.concat(
												  aM.icon,
												  ' fa-w-16 fa-fw fa-3x'
												),
											  }),
											}),
											Object(BG.jsxs)('div', {
											  className: 'details',
											  children: [
												Object(BG.jsx)('div', {
												  className: 'title',
												  children: Object(BG.jsx)(BO.a, {
													style: {
													  color: '#fff',
													  wordBreak: 'break-word',
													},
													variant: 'body2',
													gutterBottom: true,
													children: aM.name,
												  }),
												}),
												Object(BG.jsx)('div', {
												  className: 'description',
												  children: Object(BG.jsx)(
													'div',
													{
													  className: 'flex-row',
													  children: Object(BG.jsx)(
														BO.a,
														{
														  style: {
															color: '#fff',
															wordBreak:
															  'break-word',
														  },
														  variant: 'body2',
														  gutterBottom: true,
														  children:
															aM.businessrole,
														}
													  ),
													}
												  ),
												}),
											  ],
											}),
											Object(BG.jsxs)('div', {
											  className:
												Sv.toString() ===
												  aM.id.toString() &&
												aM.cid.toString() !==
												  pd.toString()
												  ? 'actions actions-show'
												  : 'actions',
											  children: [
												Object(BG.jsx)(Bg.a, {
												  title: 'Edit Role',
												  placement: 'top',
												  sx: {
													display: Sd.roleManage
													  ? ''
													  : 'none',
													backgroundColor:
													  'rgba(97, 97, 97, 0.9)',
												  },
												  arrow: true,
												  children: Object(BG.jsx)(
													'div',
													{
													  style: {
														display: Sd.roleManage
														  ? ''
														  : 'none',
													  },
													  onClick: a8,
													  id: aM.businessrole,
													  children: Object(BG.jsx)(
														'i',
														{
														  onClick: a6,
														  id: aM.cid,
														  className:
															'fas fa-user-tag fa-w-16 fa-fw fa-lg',
														}
													  ),
													}
												  ),
												}),
												Object(BG.jsx)(Bg.a, {
												  title: 'Remove Employee',
												  placement: 'top',
												  sx: {
													display: Sd.canFire
													  ? ''
													  : 'none',
													backgroundColor:
													  'rgba(97, 97, 97, 0.9)',
												  },
												  arrow: true,
												  children: Object(BG.jsx)(
													'div',
													{
													  style: {
														display: Sd.canFire
														  ? ''
														  : 'none',
													  },
													  children: Object(BG.jsx)(
														'i',
														{
														  onClick: a7,
														  id: aM.cid,
														  className:
															'fas fa-user-slash fa-w-16 fa-fw fa-lg',
														}
													  ),
													}
												  ),
												}),
											  ],
											}),
										  ],
										}),
									  },
									  aM.id
									)
								  })
								: Object(BG.jsxs)('div', {
									className: 'flex-centered',
									style: {
									  padding: '32px',
									  flexDirection: 'column',
									  textAlign: 'center',
									},
									children: [
									  Object(BG.jsx)('i', {
										className:
										  'fas fa-frown fa-w-16 fa-fw fa-3x',
										style: {
										  color: '#fff',
										  marginBottom: '32px',
										},
									  }),
									  Object(BG.jsx)(BO.a, {
										style: {
										  color: '#fff',
										  wordBreak: 'break-word',
										},
										variant: 'h6',
										gutterBottom: true,
										children: 'Nothing Here!',
									  }),
									],
								  }),
						  }),
						],
					  }),
					}),
				  }),
				],
			  })
			)
		  },
		  S9 = Object(i4.a)({
			messageMessageModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			messageMessageModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
		  }),
		  SB = function () {
			var Sc = S9(),
			  Sx = Object(B4.useState)([]),
			  Sk = Object(B9.a)(Sx, 2),
			  Sv = Sk[0],
			  SP = Sk[1],
			  SZ = Object(B4.useState)([]),
			  SV = Object(B9.a)(SZ, 2),
			  Sm = SV[0],
			  SY = SV[1],
			  Sz = Object(B4.useState)(false),
			  SF = Object(B9.a)(Sz, 2),
			  SX = SF[0],
			  SD = SF[1],
			  Sr = Object(B4.useState)(false),
			  Sl = Object(B9.a)(Sr, 2),
			  Sd = Sl[0],
			  Sj = Sl[1],
			  SH = Object(B4.useState)(false),
			  SI = Object(B9.a)(SH, 2),
			  SR = SI[0],
			  SA = SI[1],
			  SL = Object(B4.useState)(false),
			  SJ = Object(B9.a)(SL, 2),
			  SC = SJ[0],
			  SE = SJ[1],
			  SU = Object(B4.useState)(''),
			  SW = Object(B9.a)(SU, 2),
			  M0 = SW[0],
			  M1 = SW[1],
			  M2 = Object(B4.useState)(''),
			  M3 = Object(B9.a)(M2, 2),
			  M4 = M3[0],
			  M5 = M3[1],
			  M6 = Object(B4.useState)(''),
			  M7 = Object(B9.a)(M6, 2),
			  M8 = M7[0],
			  M9 = M7[1]
			Object(B4.useEffect)(function () {
			  Ba('getMessageData', {}).then(function (Mi) {
				SP(Mi.data)
				SY(Mi.data)
				M1(Mi.mynumber)
			  })
			}, [])
			var MB = function (Mi) {
			  {
				var MM = ('' + Mi)
				  .replace(/\D/g, '')
				  .match(/^(\d{3})(\d{3})(\d{4})$/)
				return MM ? '(' + MM[1] + ') ' + MM[2] + '-' + MM[3] : Mi
			  }
			}
			return (
			  Bi('updateMessages', function (Mi) {
				SP(Mi.data)
				SY(Mi.data)
				M1(Mi.mynumber)
			  }),
			  Bi('closeApps', function () {
				SE(false)
				SD(false)
				Sj(false)
				SA(false)
				M5('')
				M9('')
			  }),
			  Object(BG.jsxs)(BG.Fragment, {
				children: [
				  Object(BG.jsx)('div', {
					className: Sc.messageMessageModalContainer,
					style: { display: SC ? '' : 'none' },
					children: Object(BG.jsxs)('div', {
					  className: Sc.messageMessageModalInnerContainer,
					  children: [
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: SX ? '' : 'none' },
						  children: Object(BG.jsxs)('div', {
							className: 'lds-spinner',
							children: [
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							  Object(BG.jsx)('div', {}),
							],
						  }),
						}),
						Object(BG.jsx)('div', {
						  className: 'spinner-wrapper',
						  style: { display: Sd ? '' : 'none' },
						  children: Object(BG.jsx)(Bv.Checkmark, {
							size: '56px',
							color: '#009688',
						  }),
						}),
						Object(BG.jsxs)('div', {
						  className: 'component-simple-form',
						  style: { display: SR ? 'none' : '' },
						  children: [
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)('div', {
								className: 'input-wrapper',
								children: Object(BG.jsx)(Bw.a, {
								  fullWidth: true,
								  sx: { width: '100%' },
								  children: Object(BG.jsx)(Bc.a, {
									id: 'input-with-icon-textfield',
									label: 'Number',
									variant: 'standard',
									onChange: function (Mi) {
									  M5(Mi.target.value)
									},
									value: M4,
									inputProps: { maxLength: 10 },
								  }),
								}),
							  }),
							}),
							Object(BG.jsx)('div', {
							  children: Object(BG.jsx)(Bw.a, {
								fullWidth: true,
								sx: { width: '100%' },
								children: Object(BG.jsx)(Bc.a, {
								  multiline: true,
								  rows: 2,
								  id: 'input-with-icon-textfield',
								  label: 'Message',
								  variant: 'standard',
								  onChange: function (Mi) {
									M9(Mi.target.value)
								  },
								  value: M8,
								}),
							  }),
							}),
							Object(BG.jsxs)('div', {
							  className: 'buttons',
							  children: [
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  SE(false)
									},
									size: 'small',
									color: 'warning',
									variant: 'contained',
									children: 'Cancel',
								  }),
								}),
								Object(BG.jsx)('div', {
								  children: Object(BG.jsx)(Bk.a, {
									onClick: function () {
									  SD(true)
									  SA(true)
									  Ba('sendMessage', {
										number: M4,
										message: M8,
									  }).then(function (MS) {
										M5('')
										M9('')
										SD(false)
										Sj(true)
										setTimeout(function () {
										  Sj(false)
										  SE(false)
										  SA(false)
										}, 1000)
									  })
									},
									size: 'small',
									color: 'success',
									variant: 'contained',
									children: 'Submit',
								  }),
								}),
							  ],
							}),
						  ],
						}),
					  ],
					}),
				  }),
				  Object(BG.jsx)(is, {
					emptyMessage: 0 === Sm.length,
					primaryActions: [
					  {
						type: 'icon',
						title: 'Send Message',
						placement: 'left',
						icon: 'fas fa-comment fa-w-16',
						action: function (Mi) {
						  SE(true)
						},
						show: true,
					  },
					],
					search: {
					  filter: ['msgDisplayName'],
					  list: Sv,
					  onChange: SY,
					},
					children:
					  Sm && Sm.length > 0
						? Sm.map(function (Mi) {
							var MS
							return Object(BG.jsx)(Bq.b, {
							  to: '/chat/'.concat(
								(null === (MS = Mi.receiver) || undefined === MS
								  ? undefined
								  : MS.toString()) ===
								  (null === M0 || undefined === M0
									? undefined
									: M0.toString())
								  ? Mi.sender
								  : Mi.receiver
							  ),
							  style: {
								color: '#fff',
								textDecoration: 'none',
							  },
							  children: Object(BG.jsxs)('div', {
								className: 'component-paper cursor-pointer',
								children: [
								  Object(BG.jsx)('div', {
									className: 'notification',
									style: {
									  display: 'none',
									  backgroundColor: 'rgb(77, 208, 225)',
									},
								  }),
								  Object(BG.jsxs)('div', {
									className: 'main-container',
									children: [
									  Object(BG.jsx)('div', {
										className: 'image',
										children: Object(BG.jsx)('i', {
										  className:
											'fas fa-user-circle fa-w-16 fa-fw fa-3x',
										}),
									  }),
									  Object(BG.jsxs)('div', {
										className: 'details',
										children: [
										  Object(BG.jsx)('div', {
											className: 'title',
											children: Object(BG.jsx)(BO.a, {
											  style: {
												color: '#fff',
												wordBreak: 'break-word',
											  },
											  variant: 'body2',
											  gutterBottom: true,
											  children: MB(Mi.msgDisplayName),
											}),
										  }),
										  Object(BG.jsx)('div', {
											className: 'description',
											children: Object(BG.jsx)('div', {
											  className: 'flex-row',
											  children: Object(BG.jsx)(BO.a, {
												style: {
												  color: '#fff',
												  wordBreak: 'break-word',
												  overflow: 'hidden',
												  textOverflow: 'ellipsis',
												  WebkitLineClamp: 1,
												  WebkitBoxOrient: 'vertical',
												  display: '-webkit-box',
												},
												variant: 'body2',
												gutterBottom: true,
												children: Mi.message,
											  }),
											}),
										  }),
										],
									  }),
									  Object(BG.jsx)('div', {
										className: 'actions',
									  }),
									],
								  }),
								],
							  }),
							})
						  })
						: Object(BG.jsx)(BG.Fragment, {}),
				  }),
				],
			  })
			)
		  },
		  Si = Object(i4.a)({
			chatOuterContainer: {
			  width: '100%',
			  height: '100%',
			  overflow: 'hidden',
			  position: 'absolute',
			  bottom: '0%',
			  opacity: '1',
			},
			chatInnerContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  position: 'absolute',
			  transition: 'all 400ms ease 0s',
			  willChange: 'left',
			},
			chatSearch: {
			  width: '100%',
			  height: '64px',
			  display: 'flex',
			  padding: '8px 16px',
			  position: 'relative',
			  marginBottom: '8px',
			},
			chatSearchWrapper: {
			  width: '100%',
			  position: 'relative',
			},
			chatIcon: {
			  top: '32px',
			  right: '16px',
			  display: 'flex',
			  zIndex: '1',
			  position: 'absolute',
			  justifyContent: 'flex-end',
			},
			chatIconWrapper: {
			  color: '#fff',
			  marginLeft: '16px',
			},
			chatMessages: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  overflow: 'hidden scroll',
			  maxHeight: 'calc(100% - 72px)',
			  minHeight: 'calc(100% - 72px)',
			},
		  }),
		  SS = function (Sw) {
			var Sc = '2|4|0|1|3'.split('|')
			var SV = Object(B4.useState)(false),
			  Sm = Object(B9.a)(SV, 2),
			  SY = Sm[0],
			  Sz = Sm[1],
			  SF = Object(B4.useState)(false),
			  SX = Object(B9.a)(SF, 2),
			  SD = SX[0],
			  Sr = SX[1]
			Bi('closeApps', function () {
			  Sz(false)
			  Sr(false)
			})
			var Sk = Sw.message.match(
				/\b(http|https)?(:\/\/)?(\S*)\.(\w{2,4})(.*)/g
			  ),
			  Sv = Sw.message.split(Sk[0])[0],
			  SP = '\n\n Images Attached: ' + Sk[0].split(' ').length
			return Object(BG.jsxs)(BG.Fragment, {
			  children: [
				Object(BG.jsxs)('div', {
				  onClick: function () {
					Sz(!SY)
				  },
				  className: 'component-image-container',
				  style: { marginBottom: '5%' },
				  children: [
					Object(BG.jsx)('div', {
					  children: Object(BG.jsx)(BO.a, {
						style: {
						  color: '#fff',
						  wordBreak: 'break-word',
						},
						variant: 'body2',
						gutterBottom: true,
						children: SP,
					  }),
					}),
					Object(BG.jsxs)('div', {
					  className: SY
						? 'container'
						: 'container container-max-height',
					  children: [
						Object(BG.jsxs)('div', {
						  className: 'blocker',
						  style: { display: SY ? 'none' : '' },
						  children: [
							Object(BG.jsx)('i', {
							  className: 'fas fa-eye fa-w-18 fa-fw fa-3x',
							  style: {
								color: 'black',
								marginTop: '1%',
								textShadow: '0 0 black',
							  },
							}),
							Object(BG.jsx)(BO.a, {
							  style: {
								color: '#fff',
								wordBreak: 'break-word',
							  },
							  variant: 'body1',
							  gutterBottom: true,
							  children: 'Click to View',
							}),
							Object(BG.jsx)(BO.a, {
							  style: {
								color: '#fff',
								textAlign: 'center',
							  },
							  variant: 'body2',
							  gutterBottom: true,
							  children:
								'Only reveal images from those you know are not total pricks',
							}),
						  ],
						}),
						Object(BG.jsx)('div', {
						  onMouseEnter: function () {
							SY && Sr(true)
						  },
						  onMouseLeave: function () {
							Sr(false)
						  },
						  className: SY ? 'image' : '',
						  style: {
							backgroundImage: SY
							  ? 'url('.concat(Sk[0].split(' '), ')')
							  : '',
						  },
						}),
						Object(BG.jsx)('div', { className: 'spacer' }),
					  ],
					}),
					Object(BG.jsx)(iu.a, {
					  open: SD,
					  style: {
						top: '49%',
						left: '42%',
					  },
					  placement: 'bottom-end',
					  disablePortal: false,
					  modifiers: [
						{
						  name: 'flip',
						  enabled: false,
						  options: {
							altBoundary: false,
							rootBoundary: 'document',
							padding: 8,
						  },
						},
						{
						  name: 'preventOverflow',
						  enabled: false,
						  options: {
							altAxis: false,
							altBoundary: true,
							tether: false,
							rootBoundary: 'document',
							padding: 8,
						  },
						},
					  ],
					  children: Object(BG.jsx)('div', {
						children: Object(BG.jsx)('img', {
						  alt: 'useful',
						  src: Sk[0].split(' '),
						  style: {
							maxHeight: '600px',
							maxWidth: '800px',
						  },
						}),
					  }),
					}),
				  ],
				}),
				Object(BG.jsx)('div', {
				  className: 'inner '.concat(
					Sw.sender === Sw.clientNumber ? 'inner-out' : 'inner-in'
				  ),
				  children: Object(BG.jsx)(BO.a, {
					style: {
					  color: '#fff',
					  wordBreak: 'break-word',
					},
					variant: 'body2',
					gutterBottom: true,
					children: Sv,
				  }),
				}),
			  ],
			})
		  },
		  SM = function () {
			{
			  var Sc = Si(),
				Sx = Object(B4.useState)([]),
				Sk = Object(B9.a)(Sx, 2),
				Sv = (Sk[0], Sk[1]),
				SP = Object(B4.useState)([]),
				SZ = Object(B9.a)(SP, 2),
				SV = SZ[0],
				Sm = SZ[1],
				SY = Object(BP.c)(Bl),
				Sz = Object(B9.a)(SY, 2),
				SF = Sz[0],
				SX = Sz[1],
				SD = Object(BP.c)(Bd),
				Sr = Object(B9.a)(SD, 2),
				Sl = (Sr[0], Sr[1]),
				Sd = Object(B4.useState)(''),
				Sj = Object(B9.a)(Sd, 2),
				SH = Sj[0],
				SI = Sj[1],
				SR = Object(B4.useState)(''),
				SA = Object(B9.a)(SR, 2),
				SL = SA[0],
				SJ = SA[1],
				SC = Object(B4.useState)(''),
				SE = Object(B9.a)(SC, 2),
				SU = (SE[0], SE[1]),
				SW = Object(B4.useRef)(null),
				M0 = Object(B4.useState)(false),
				M1 = Object(B9.a)(M0, 2),
				M2 = M1[0],
				M3 = M1[1],
				M4 = Object(BQ.g)().chatId,
				M5 = Object(BP.c)(BC),
				M6 = Object(B9.a)(M5, 2),
				M7 = M6[0]
			  M6[1]
			  Object(B4.useEffect)(
				function () {
				  Ba('getChatData', { number: M4 }).then(function (MS) {
					Sv(MS.messages)
					Sm(MS.messages)
					SI(MS.displayName)
					SJ(MS.clientNumber)
					M3(MS.isDisplayName)
				  })
				},
				[M4]
			  )
			  var M8 = Object(BQ.f)(),
				M9 = function (Mi) {
				  var MS = ('' + Mi)
					.replace(/\D/g, '')
					.match(/^(\d{3})(\d{3})(\d{4})$/)
				  return MS ? '(' + MS[1] + ') ' + MS[2] + '-' + MS[3] : Mi
				},
				MB = function (Mi) {
				  for (
					var MS = '', Mp = '0123456789'.length, Ma = 0;
					Ma < Mi;
					Ma++
				  ) {
					MS += '0123456789'.charAt(Math.floor(Math.random() * Mp))
				  }
				  return MS
				}
			  return (
				Bi('updateChatMessages', function (Mi) {
				  M4.toString() === Mi.sender.toString() &&
					(Sv(Mi.messages),
					Sm(Mi.messages),
					SI(Mi.displayName),
					SJ(Mi.clientNumber),
					M3(Mi.isDisplayName))
				}),
				Bi('closeApps', function () {}),
				Object(BG.jsx)(BG.Fragment, {
				  children: Object(BG.jsx)('div', {
					className: Sc.chatOuterContainer,
					style: { zIndex: 500 },
					children: Object(BG.jsx)('div', {
					  className: Sc.chatInnerContainer,
					  children: Object(BG.jsxs)('div', {
						className: 'messages-container',
						children: [
						  Object(BG.jsxs)('div', {
							className: Sc.chatSearch,
							children: [
							  Object(BG.jsx)(Bg.a, {
								title: 'Go Back',
								placement: 'right',
								sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
								arrow: true,
								children: Object(BG.jsx)('div', {
								  style: {
									color: '#fff',
									width: '40px',
									display: 'flex',
									alignItems: 'center',
								  },
								  children: Object(BG.jsx)('i', {
									onClick: function () {
									  M8.push('/messages')
									},
									className:
									  'fas fa-chevron-left fa-w-10 fa-fw fa-lg',
								  }),
								}),
							  }),
							  Object(BG.jsx)('div', {
								className: Sc.chatSearchWrapper,
								children: Object(BG.jsx)('div', {
								  className: 'input-wrapper',
								  children: Object(BG.jsx)(Bw.a, {
									fullWidth: true,
									sx: { width: '100%' },
									children: Object(BG.jsx)(Bc.a, {
									  id: 'input-with-icon-textfield',
									  label: 'Search',
									  InputProps: {
										startAdornment: Object(BG.jsx)(Bx.a, {
										  position: 'start',
										  children: Object(BG.jsx)(ia.a, {}),
										}),
									  },
									  variant: 'standard',
									}),
								  }),
								}),
							  }),
							],
						  }),
						  Object(BG.jsx)('div', {
							className: Sc.chatIcon,
							children: Object(BG.jsx)('div', {
							  className: Sc.chatIconWrapper,
							  children: Object(BG.jsx)(Bg.a, {
								title: 'Call',
								placement: 'left',
								sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
								arrow: true,
								children: Object(BG.jsx)('i', {
								  onClick: function () {
									return (function (MM) {
									  Ba('rd-ui:callStart', { number: MM })
									  var Mp = MB(4),
										Ma = BU()().unix(),
										Ms = SF,
										Mo = {
										  id: Mp,
										  number: MM,
										  name: SH,
										  date: Ma,
										  state: 'out',
										},
										MQ = [].concat(Object(B8.a)(Ms || []), [
										  Mo,
										])
									  SX(MQ)
									  Sl(MQ)
									})(M4)
								  },
								  style: { fontSize: '1.2em' },
								  className: 'fas fa-phone fa-w-16 fa-fw fa-lg',
								}),
							  }),
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: Sc.chatIcon,
							style: {
							  display: M2 ? 'none' : '',
							  right: '50px',
							},
							children: Object(BG.jsx)('div', {
							  className: Sc.chatIconWrapper,
							  children: Object(BG.jsx)(Bg.a, {
								title: 'Add Contact',
								placement: 'left',
								sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
								arrow: true,
								children: Object(BG.jsx)('i', {
								  onClick: function () {},
								  style: { fontSize: '1.2em' },
								  className:
									'fas fa-user-plus fa-w-16 fa-fw fa-lg',
								}),
							  }),
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: Sc.chatMessages,
							children: Object(BG.jsxs)('div', {
							  className: 'messages-container',
							  children: [
								Object(BG.jsxs)('div', {
								  className: 'contact-info',
								  children: [
									Object(BG.jsx)('div', {
									  className: 'icon',
									  children: Object(BG.jsx)('i', {
										className:
										  'fas fa-user-circle fa-w-16 fa-fw fa-2x',
									  }),
									}),
									Object(BG.jsxs)('div', {
									  className: 'text',
									  children: [
										Object(BG.jsx)(BO.a, {
										  style: {
											display: M2 ? '' : 'none',
											color: '#fff',
											wordBreak: 'break-word',
										  },
										  variant: 'body2',
										  gutterBottom: true,
										  children: SH,
										}),
										Object(BG.jsx)(BO.a, {
										  style: {
											color: '#fff',
											wordBreak: 'break-word',
										  },
										  variant: 'body2',
										  gutterBottom: true,
										  children: M9(M2 ? M4 : SH),
										}),
									  ],
									}),
								  ],
								}),
								Object(BG.jsx)('div', {
								  className: 'messages',
								  style: { marginBottom: '20px' },
								  children:
									SV && SV.length > 0
									  ? SV.map(function (Mi) {
										  return Object(BG.jsxs)('div', {
											className: 'message '.concat(
											  Mi.sender === SL
												? 'message-out'
												: 'message-in'
											),
											children: [
											  (Mi.message.indexOf('imgur.com') >=
												0 &&
												M7) ||
											  (Mi.message.indexOf(
												'discordapp.com'
											  ) >= 0 &&
												M7)
												? Object(BG.jsx)(SS, {
													message: Mi.message,
													sender: Mi.sender,
													clientNumber: SL,
												  })
												: Object(BG.jsx)(BG.Fragment, {
													children: Object(BG.jsx)(
													  'div',
													  {
														className:
														  'inner '.concat(
															Mi.sender === SL
															  ? 'inner-out'
															  : 'inner-in'
														  ),
														children: Object(BG.jsx)(
														  BO.a,
														  {
															style: {
															  color: '#fff',
															  wordBreak:
																'break-word',
															},
															variant: 'body2',
															gutterBottom: true,
															children: Mi.message,
														  }
														),
													  }
													),
												  }),
											  Object(BG.jsx)('div', {
												className: 'timestamp '.concat(
												  Mi.sender === SL
													? 'timestamp-out'
													: 'timestamp-in'
												),
												children: Object(BG.jsx)(BO.a, {
												  style: {
													wordBreak: 'break-word',
												  },
												  variant: 'body2',
												  gutterBottom: true,
												  children: BU()(
													1000 * Mi.unix
												  ).fromNow(),
												}),
											  }),
											],
										  })
										})
									  : Object(BG.jsx)(BG.Fragment, {}),
								}),
								Object(BG.jsx)('div', {
								  className: 'send-message',
								  children: Object(BG.jsx)('textarea', {
									ref: SW,
									onKeyDown: function (Mi) {
									  {
										if (13 === Mi.keyCode) {
										  if (
											undefined === Mi.target.value ||
											'' === Mi.target.value
										  ) {
											return
										  }
										  Ba('sendMessage', {
											number: M4,
											message: Mi.target.value,
										  }).then(function (Mp) {
											SW.current.value = ''
											Sv(Mp.messages)
											Sm(Mp.messages)
											SI(Mp.displayName)
											SJ(Mp.clientNumber)
											M3(Mp.isDisplayName)
											SU('')
										  })
										}
									  }
									},
									onKeyPress: function (Mi) {
									  'Enter' === Mi.key && Mi.preventDefault()
									},
									placeholder: 'Send message...',
								  }),
								}),
							  ],
							}),
						  }),
						],
					  }),
					}),
				  }),
				})
			  )
			}
		  },
		  Sp = Object(i4.a)({
			debtOuterContainer: {
			  width: '100%',
			  height: '100%',
			  overflow: 'hidden',
			  position: 'absolute',
			  bottom: '0%',
			  opacity: '1',
			},
			debtInnerContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  position: 'absolute',
			  transition: 'all 400ms ease 0s',
			  willChange: 'left',
			},
			debtSearch: {
			  width: '100%',
			  height: '64px',
			  display: 'flex',
			  padding: '8px 16px',
			  position: 'relative',
			  marginBottom: '8px',
			},
			debtSearchWrapper: {
			  width: '100%',
			  position: 'relative',
			},
			debtIcon: {
			  top: '32px',
			  right: '16px',
			  display: 'flex',
			  zIndex: '1',
			  position: 'absolute',
			  justifyContent: 'flex-end',
			},
			debtIconWrapper: {
			  color: '#fff',
			  marginLeft: '16px',
			},
			debtWrapper: {
			  maxHeight: '41vh',
			  width: '100%',
			  overflowY: 'auto',
			  position: 'absolute',
			  top: '10vh',
			},
			debtFees: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  maxHeight: 'calc(100% - 72px)',
			},
			debtLoans: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  maxHeight: 'calc(100% - 72px)',
			},
		  }),
		  Sa = function () {
			var Sw = Sp()
			return Object(BG.jsx)(BG.Fragment, {
			  children: Object(BG.jsx)('div', {
				className: Sw.debtOuterContainer,
				style: { zIndex: 500 },
				children: Object(BG.jsx)('div', {
				  className: Sw.debtInnerContainer,
				  children: Object(BG.jsxs)('div', {
					className: 'debt-container',
					children: [
					  Object(BG.jsx)('div', {
						className: Sw.debtSearch,
						children: Object(BG.jsx)('div', {
						  className: Sw.debtSearchWrapper,
						  children: Object(BG.jsx)('div', {
							className: 'input-wrapper',
							children: Object(BG.jsx)(Bw.a, {
							  fullWidth: true,
							  sx: { width: '100%' },
							  children: Object(BG.jsx)(Bc.a, {
								id: 'input-with-icon-textfield',
								label: 'Search',
								InputProps: {
								  startAdornment: Object(BG.jsx)(Bx.a, {
									position: 'start',
									children: Object(BG.jsx)(ia.a, {}),
								  }),
								},
								variant: 'standard',
							  }),
							}),
						  }),
						}),
					  }),
					  Object(BG.jsx)('div', {
						className: Sw.debtIcon,
						children: Object(BG.jsx)('div', {
						  className: Sw.debtIconWrapper,
						  children: Object(BG.jsx)(Bg.a, {
							title: 'Pay Loan',
							placement: 'left',
							sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
							arrow: true,
							children: Object(BG.jsx)('i', {
							  style: { fontSize: '1.2em' },
							  className: 'fas fa-donate fa-w-16 fa-fw fa-lg',
							}),
						  }),
						}),
					  }),
					  Object(BG.jsxs)('div', {
						className: Sw.debtWrapper,
						children: [
						  Object(BG.jsxs)('div', {
							className: Sw.debtFees,
							children: [
							  Object(BG.jsx)(BO.a, {
								style: {
								  color: '#fff',
								  wordBreak: 'break-word',
								  marginTop: '5px',
								},
								variant: 'body1',
								gutterBottom: true,
								children: 'Maintenance Fees',
							  }),
							  Object(BG.jsx)('div', {
								className: 'component-paper cursor-pointer',
								children: Object(BG.jsxs)('div', {
								  className: 'main-container',
								  children: [
									Object(BG.jsx)('div', {
									  className: 'image',
									  children: Object(BG.jsx)('i', {
										className:
										  'fas fa-car fa-w-16 fa-fw fa-3x',
									  }),
									}),
									Object(BG.jsxs)('div', {
									  className: 'details',
									  children: [
										Object(BG.jsx)('div', {
										  className: 'title',
										  children: Object(BG.jsx)(BO.a, {
											style: {
											  color: '#fff',
											  wordBreak: 'break-word',
											},
											variant: 'body2',
											gutterBottom: true,
											children: '$670,000.00',
										  }),
										}),
										Object(BG.jsx)('div', {
										  className: 'description',
										  children: Object(BG.jsx)('div', {
											className: 'flex-row',
											children: Object(BG.jsx)(BO.a, {
											  style: {
												color: '#fff',
												wordBreak: 'break-word',
											  },
											  variant: 'body2',
											  gutterBottom: true,
											  children: 'Vehicles',
											}),
										  }),
										}),
									  ],
									}),
									Object(BG.jsx)('div', {
									  className: 'actions',
									}),
								  ],
								}),
							  }),
							],
						  }),
						  Object(BG.jsxs)('div', {
							className: Sw.debtLoans,
							children: [
							  Object(BG.jsx)(BO.a, {
								style: {
								  color: '#fff',
								  wordBreak: 'break-word',
								  marginTop: '5px',
								},
								variant: 'body1',
								gutterBottom: true,
								children: 'Loans',
							  }),
							  Object(BG.jsx)('div', {
								className: 'component-paper cursor-pointer',
								children: Object(BG.jsxs)('div', {
								  className: 'main-container',
								  children: [
									Object(BG.jsx)('div', {
									  className: 'image',
									  children: Object(BG.jsx)('i', {
										className:
										  'fas fa-file-invoice-dollar fa-w-16 fa-fw fa-3x',
									  }),
									}),
									Object(BG.jsxs)('div', {
									  className: 'details',
									  children: [
										Object(BG.jsx)('div', {
										  className: 'title',
										  children: Object(BG.jsx)(BO.a, {
											style: {
											  color: '#fff',
											  wordBreak: 'break-word',
											},
											variant: 'body2',
											gutterBottom: true,
											children: 'Diamond Hand Credit',
										  }),
										}),
										Object(BG.jsx)('div', {
										  className: 'description',
										  children: Object(BG.jsx)('div', {
											className: 'flex-row',
											children: Object(BG.jsx)(BO.a, {
											  style: {
												color: '#fff',
												wordBreak: 'break-word',
											  },
											  variant: 'body2',
											  gutterBottom: true,
											  children: '$547,800.00',
											}),
										  }),
										}),
									  ],
									}),
									Object(BG.jsx)('div', {
									  className: 'actions',
									}),
								  ],
								}),
							  }),
							],
						  }),
						],
					  }),
					],
				  }),
				}),
			  }),
			})
		  },
		  Ss = Object(i4.a)({
			wenmoOuterContainer: {
			  width: '100%',
			  height: '100%',
			  overflow: 'hidden',
			  position: 'absolute',
			  bottom: '0%',
			  opacity: '1',
			},
			wenmoInnerContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  position: 'absolute',
			  transition: 'all 400ms ease 0s',
			  willChange: 'left',
			},
			wenmoSearch: {
			  width: '100%',
			  height: '64px',
			  display: 'flex',
			  padding: '8px 16px',
			  position: 'relative',
			  marginBottom: '8px',
			},
			wenmoSearchWrapper: {
			  width: '100%',
			  position: 'relative',
			},
			wenmoIcon: {
			  top: '32px',
			  right: '16px',
			  display: 'flex',
			  zIndex: '1',
			  position: 'absolute',
			  justifyContent: 'flex-end',
			},
			wenmoIconWrapper: {
			  color: '#fff',
			  marginLeft: '16px',
			},
			wenmoLogs: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  overflow: 'hidden scroll',
			  maxHeight: 'calc(100% - 72px)',
			  minHeight: 'calc(100% - 72px)',
			},
		  }),
		  So = function () {
			var Sw = Ss()
			return Object(BG.jsx)(BG.Fragment, {
			  children: Object(BG.jsx)('div', {
				className: Sw.wenmoOuterContainer,
				style: { zIndex: 500 },
				children: Object(BG.jsx)('div', {
				  className: Sw.wenmoInnerContainer,
				  children: Object(BG.jsxs)('div', {
					className: 'wenmo-container',
					children: [
					  Object(BG.jsx)('div', {
						className: Sw.wenmoSearch,
						children: Object(BG.jsx)('div', {
						  className: Sw.wenmoSearchWrapper,
						  children: Object(BG.jsx)('div', {
							className: 'input-wrapper',
							children: Object(BG.jsx)(Bw.a, {
							  fullWidth: true,
							  sx: { width: '100%' },
							  children: Object(BG.jsx)(Bc.a, {
								id: 'input-with-icon-textfield',
								label: 'Search',
								InputProps: {
								  startAdornment: Object(BG.jsx)(Bx.a, {
									position: 'start',
									children: Object(BG.jsx)(ia.a, {}),
								  }),
								},
								variant: 'standard',
							  }),
							}),
						  }),
						}),
					  }),
					  Object(BG.jsx)('div', {
						className: Sw.wenmoIcon,
						children: Object(BG.jsx)('div', {
						  className: Sw.wenmoIconWrapper,
						  children: Object(BG.jsx)(Bg.a, {
							title: 'Send Money',
							placement: 'left',
							sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
							arrow: true,
							children: Object(BG.jsx)('i', {
							  style: { fontSize: '1.2em' },
							  className:
								'fas fa-hand-holding-usd fa-w-16 fa-fw fa-lg',
							}),
						  }),
						}),
					  }),
					  Object(BG.jsxs)('div', {
						className: Sw.wenmoLogs,
						children: [
						  Object(BG.jsx)(BO.a, {
							style: {
							  color: '#fff',
							  wordBreak: 'break-word',
							  marginTop: '5px',
							},
							variant: 'body1',
							gutterBottom: true,
							children: 'Transfers',
						  }),
						  Object(BG.jsx)('div', {
							className: 'component-paper cursor-pointer',
							children: Object(BG.jsxs)('div', {
							  className: 'main-container',
							  children: [
								Object(BG.jsx)('div', {
								  className: 'details',
								  children: Object(BG.jsxs)('div', {
									className: 'description',
									children: [
									  Object(BG.jsxs)('div', {
										className: 'flex-row',
										style: {
										  justifyContent: 'space-between',
										},
										children: [
										  Object(BG.jsx)(BO.a, {
											style: {
											  color: '#8afc88',
											  wordBreak: 'break-word',
											},
											variant: 'body2',
											gutterBottom: true,
											children: '$2,200.00',
										  }),
										  Object(BG.jsx)(BO.a, {
											style: {
											  color: '#fff',
											  wordBreak: 'break-word',
											},
											variant: 'body2',
											gutterBottom: true,
											children: 'Jerry Padel',
										  }),
										],
									  }),
									  Object(BG.jsx)('div', {
										className: 'flex-row',
										style: { justifyContent: 'flex-end' },
										children: Object(BG.jsx)(BO.a, {
										  style: {
											color: '#fff',
											wordBreak: 'break-word',
										  },
										  variant: 'body2',
										  gutterBottom: true,
										  children: '12 minutes ago',
										}),
									  }),
									],
								  }),
								}),
								Object(BG.jsx)('div', { className: 'actions' }),
							  ],
							}),
						  }),
						],
					  }),
					],
				  }),
				}),
			  }),
			})
		  },
		  SQ = B2(131),
		  SO = function () {
			return Object(BG.jsx)(BG.Fragment, {
			  children: Object(BG.jsx)('div', {
				className: 'calculator-outer-container',
				style: { zIndex: 500 },
				children: Object(BG.jsx)('div', {
				  className: 'calculator-container',
				  style: { zIndex: 500 },
				  children: Object(BG.jsx)(SQ.a, {}),
				}),
			  }),
			})
		  },
		  Sn = function (Sw) {
			return Object(BG.jsx)(BG.Fragment, {
			  children: Object(BG.jsx)(BO.a, {
				variant: Sw.variant,
				style: Sw.style,
				sx: Sw.sx,
				gutterBottom: Sw.gutterBottom,
				children: Sw.children,
			  }),
			})
		  },
		  SK = function (Sw) {
			return Object(BG.jsx)(BG.Fragment, {
			  children: Object(BG.jsx)('i', {
				onClick: Sw.onClick,
				className: 'fas fa-'.concat(Sw.icon, ' fa-').concat(Sw.size),
				style: { color: Sw.color },
				children: Sw.children,
			  }),
			})
		  },
		  Sb = Object(i4.a)({
			nameWrapper: {
			  display: 'flex',
			  justifyContent: 'space-between',
			},
		  }),
		  Sg = function () {
			var Sc = Object(B4.useState)([]),
			  Sx = Object(B9.a)(Sc, 2),
			  Sk = Sx[0],
			  Sv = Sx[1],
			  SP = Object(B4.useState)([]),
			  SZ = Object(B9.a)(SP, 2),
			  SV = SZ[0],
			  Sm = SZ[1],
			  SY = Object(B4.useState)(''),
			  Sz = Object(B9.a)(SY, 2),
			  SF = Sz[0],
			  SX = Sz[1],
			  SD = Object(B4.useState)(false),
			  Sr = Object(B9.a)(SD, 2),
			  Sl = Sr[0],
			  Sd = Sr[1]
			Object(B4.useEffect)(function () {
			  Ba('rd-ui:getDOJData', {}).then(function (SA) {
				Sv(undefined === SA.data.list ? [] : SA.data.list)
				Sm(undefined === SA.data.list ? [] : SA.data.list)
				SX(SA.data.status)
				Sd(undefined !== SA.data.granted && SA.data.granted)
			  })
			}, [])
			var Sj = Sb(),
			  SH = {
				Lawyer: SV.filter(function (SI) {
				  return 'lawyer' === SI.job
				}),
				Judge: SV.filter(function (SI) {
				  return 'judge' === SI.job
				}),
			  }
			return Object(BG.jsxs)(is, {
			  emptyMessage: 0 === SV.length,
			  primaryActions: [],
			  search: {
				filter: ['name'],
				list: Sk,
				onChange: Sm,
			  },
			  children: [
				Sl &&
				  Object(BG.jsx)('div', {
					children: Object(BG.jsx)('div', {
					  style: {
						textAlign: 'left',
						marginTop: 8,
						marginBottom: 8,
					  },
					  children: Object(BG.jsx)(iX, {
						label: 'Status',
						value: SF,
						onChange: function (SI) {
						  return (function (SA) {
							Ba('rd-ui:setDOJStatus', { status: SA }).then(
							  function (SJ) {
								Sv(undefined === SJ.data.list ? [] : SJ.data.list)
								Sm(undefined === SJ.data.list ? [] : SJ.data.list)
								Sd(
								  undefined !== SJ.data.granted && SJ.data.granted
								)
								SX(SJ.data.status)
							  }
							)
							SX(SA)
						  })(SI)
						},
						items: [
						  {
							id: 'Available',
							name: 'Available',
						  },
						  {
							id: 'In Trial',
							name: 'In Trial',
						  },
						  {
							id: 'Busy',
							name: 'Busy',
						  },
						],
					  }),
					}),
				  }),
				Object.keys(SH)
				  .filter(function (SI) {
					return !!SH[SI].length
				  })
				  .map(function (SI) {
					return Object(BG.jsxs)(
					  'div',
					  {
						style: {
						  marginBottom: 8,
						  paddingBottom: 8,
						  borderBottom: '1px solid white',
						},
						children: [
						  Object(BG.jsxs)(Sn, {
							style: {
							  color: '#fff',
							  wordBreak: 'break-word',
							  marginBottom: 8,
							},
							variant: 'body1',
							gutterBottom: true,
							children: [SI, '(s)'],
						  }),
						  SH[SI].map(function (SA, SL) {
							return Object(BG.jsxs)(
							  'div',
							  {
								className: Sj.nameWrapper,
								children: [
								  Object(BG.jsx)(Sn, {
									style: {
									  color: '#fff',
									  wordBreak: 'break-word',
									},
									variant: 'body2',
									gutterBottom: true,
									children: SA.name,
								  }),
								  Object(BG.jsx)(Sn, {
									style: {
									  color: '#fff',
									  wordBreak: 'break-word',
									},
									variant: 'body2',
									gutterBottom: true,
									children: SA.status,
								  }),
								  Object(BG.jsx)('div', {
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Call',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
									  },
									  arrow: true,
									  children: Object(BG.jsx)(SK, {
										onClick: function () {
										  Ba('rd-ui:callStart', {
											number: Number(SA.phone),
										  })
										},
										color: 'white',
										size: 'lg',
										icon: 'phone',
									  }),
									}),
								  }),
								],
							  },
							  SL
							)
						  }),
						],
					  },
					  SI
					)
				  }),
			  ],
			})
		  },
		  ST = Object(i4.a)({
			sportsBookBetModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			sportsBookBetModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
		  }),
		  SN = function (Sw) {
			{
			  var Sx = Object(B4.useState)(false),
				Sk = Object(B9.a)(Sx, 2),
				Sv = Sk[0],
				SP = Sk[1],
				SZ = Object(BP.c)(BZ),
				SV = Object(B9.a)(SZ, 2),
				Sm = SV[0],
				SY = SV[1],
				Sz = function (SF) {
				  SY(SF)
				}
			  return Object(BG.jsx)(BG.Fragment, {
				children: Object(BG.jsxs)(
				  'div',
				  {
					id: Sw.id,
					className: 'component-paper cursor-pointer',
					onClick: function () {
					  SP(!Sv)
					},
					onMouseEnter: function (SF) {
					  return Sz(Sw.id)
					},
					onMouseLeave: function () {
					  return Sz('')
					},
					children: [
					  Object(BG.jsxs)('div', {
						className: 'main-container',
						children: [
						  Object(BG.jsx)('div', {
							className: 'image',
							children: Object(BG.jsx)('i', {
							  className: ''.concat(
								Sw.icon,
								' fa-w-16 fa-fw fa-3x'
							  ),
							}),
						  }),
						  Object(BG.jsxs)('div', {
							className: 'details',
							children: [
							  Object(BG.jsx)('div', {
								className: 'title',
								children: Object(BG.jsx)(BO.a, {
								  style: {
									color: '#fff',
									wordBreak: 'break-word',
								  },
								  variant: 'body2',
								  gutterBottom: true,
								  children: Sw.name,
								}),
							  }),
							  Object(BG.jsx)('div', {
								className: 'description',
								children: Object(BG.jsx)('div', {
								  className: 'flex-row',
								  children: Object(BG.jsx)(BO.a, {
									style: {
									  color: '#fff',
									  wordBreak: 'break-word',
									},
									variant: 'body2',
									gutterBottom: true,
									children: Sw.description,
								  }),
								}),
							  }),
							],
						  }),
						  Object(BG.jsx)('div', {
							className:
							  Sm.toString() === Sw.id.toString()
								? 'actions actions-show'
								: 'actions',
							children: Object(BG.jsx)(Bg.a, {
							  title: 'Place Bet',
							  placement: 'top',
							  sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
							  arrow: true,
							  children: Object(BG.jsx)('div', {
								children: Object(BG.jsx)('i', {
								  onClick: function (SF) {
									SF.stopPropagation()
								  },
								  id: Sw.id,
								  className:
									'fas fa-dollar-sign fa-w-16 fa-fw fa-lg',
								}),
							  }),
							}),
						  }),
						],
					  }),
					  Object(BG.jsxs)(iw.a, {
						in: Sv,
						timeout: 'auto',
						unmountOnExit: true,
						children: [
						  Object(BG.jsx)(Bw.a, {
							sx: {
							  width: '85%',
							  marginLeft: '7.5%',
							  marginBottom: '1.5%',
							},
							children: Object(BG.jsx)(Bc.a, {
							  id: 'input-with-icon-textfield',
							  variant: 'standard',
							  value: 'Bovice ($323k / 66.5%)',
							  InputProps: {
								readOnly: true,
								startAdornment: Object(BG.jsx)(Bx.a, {
								  position: 'start',
								  children: Object(BG.jsx)('i', {
									className: 'fas fa-funnel-dollar',
									style: { color: 'white' },
								  }),
								}),
							  },
							}),
						  }),
						  Object(BG.jsx)(Bw.a, {
							sx: {
							  width: '85%',
							  marginLeft: '7.5%',
							  marginBottom: '1.5%',
							},
							children: Object(BG.jsx)(Bc.a, {
							  id: 'input-with-icon-textfield',
							  variant: 'standard',
							  value: 'Kael Soze ($162k / 33.5%)',
							  InputProps: {
								readOnly: true,
								startAdornment: Object(BG.jsx)(Bx.a, {
								  position: 'start',
								  children: Object(BG.jsx)('i', {
									className: 'fas fa-funnel-dollar',
									style: { color: 'white' },
								  }),
								}),
							  },
							}),
						  }),
						],
					  }),
					],
				  },
				  Sw.id
				),
			  })
			}
		  },
		  SG = function () {
			{
			  ST()
			  var Sc = Object(B4.useState)([
				  {
					id: '1',
					event: 'VLC 3 Main Event',
					fighters: 'Kael Soze VS Bovice',
				  },
				]),
				Sx = Object(B9.a)(Sc, 2),
				Sk = Sx[0],
				Sv = (Sx[1], Object(B4.useState)(false)),
				SP = Object(B9.a)(Sv, 2),
				SZ = (SP[0], SP[1]),
				SV = Object(B4.useState)(false),
				Sm = Object(B9.a)(SV, 2),
				SY = (Sm[0], Sm[1]),
				Sz = Object(B4.useState)(false),
				SF = Object(B9.a)(Sz, 2),
				SX = (SF[0], SF[1])
			  return (
				Object(B4.useEffect)(function () {}, []),
				Bi('closeApps', function () {
				  SZ(false)
				  SX(false)
				  SY(false)
				}),
				Object(BG.jsx)(BG.Fragment, {
				  children: Object(BG.jsxs)(is, {
					emptyMessage: 0 === Sk.length,
					primaryActions: [],
					search: [],
					children: [
					  Object(BG.jsx)('div', {
						style: {
						  display: 'flex',
						  justifyContent: 'center',
						  marginBottom: '15%',
						},
						children: Object(BG.jsx)('i', {
						  className: 'fas fa-gem fa-3x',
						  style: { color: 'white' },
						}),
					  }),
					  Sk && Sk.length > 0
						? Sk.map(function (Sr) {
							return Object(BG.jsx)(SN, {
							  id: Sr.id,
							  icon: 'fas fa-dollar-sign',
							  name: Sr.event,
							  description: Sr.fighters,
							  fighters: [],
							})
						  })
						: Object(BG.jsx)(BG.Fragment, {}),
					],
				  }),
				})
			  )
			}
		  },
		  Sy = Object(i4.a)({
			root: {
			  top: '0px',
			  left: '0px',
			  width: '100vw',
			  height: '100vh',
			  position: 'absolute',
			  maxWidth: '100vw',
			  minWidth: '100vw',
			  maxHeight: '100vh',
			  minHeight: '100vh',
			  pointerEvents: 'none',
			  border: '0px',
			  margin: '0px',
			  outline: '0px',
			  padding: '0px',
			  overflow: 'hidden',
			  '& .MuiInput-root': {
				color: 'white',
				fontSize: '1.3vmin',
			  },
			  '& .MuiInput-underline:hover:not(.Mui-disabled):before': {
				borderColor: 'darkgray',
			  },
			  '& .MuiInput-underline:before': {
				borderColor: 'darkgray',
				color: 'darkgray',
			  },
			  '& .MuiInput-underline:after': {
				borderColor: 'white',
				color: 'darkgray',
			  },
			  '& .MuiInputLabel-animated': {
				color: 'darkgray',
				fontSize: '1.5vmin',
			  },
			  '& .MuiInputAdornment-root': { color: 'darkgray' },
			  '& label.Mui-focused': { color: 'darkgray' },
			},
			input: {
			  '& input[type=number]': { '-moz-appearance': 'textfield' },
			  '& input[type=number]::-webkit-outer-spin-button': {
				'-webkit-appearance': 'none',
				margin: 0,
			  },
			  '& input[type=number]::-webkit-inner-spin-button': {
				'-webkit-appearance': 'none',
				margin: 0,
			  },
			},
			paynlessOuterContainer: {
			  width: '100%',
			  height: '100%',
			  overflow: 'hidden',
			  position: 'absolute',
			  bottom: '0%',
			  opacity: '1',
			},
			paynlessInnerContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  position: 'absolute',
			  transition: 'all 400ms ease 0s',
			  willChange: 'left',
			},
			paynlessSearch: {
			  width: '100%',
			  height: '64px',
			  display: 'flex',
			  padding: '8px 16px',
			  position: 'relative',
			  marginBottom: '8px',
			},
			paynlessSearchWrapper: {
			  width: '100%',
			  position: 'relative',
			},
			paynlessIcon: {
			  top: '32px',
			  right: '16px',
			  display: 'flex',
			  zIndex: '1',
			  position: 'absolute',
			  justifyContent: 'flex-end',
			},
			paynlessIconWrapper: {
			  color: '#fff',
			  marginLeft: '16px',
			},
			paynlesspaynless: {
			  width: '100%',
			  height: 'calc(100% - 72px)',
			  padding: '0px 16px',
			  overflow: 'hidden scroll',
			  maxHeight: 'calc(100% - 72px)',
			  minHeight: 'calc(100% - 72px)',
			},
		  }),
		  Su = function () {
			Sy()
			var Sc = Object(BP.c)(BZ),
			  Sx = Object(B9.a)(Sc, 2),
			  Sk = Sx[0],
			  Sv = Sx[1],
			  SP = Object(B4.useState)([]),
			  SZ = Object(B9.a)(SP, 2),
			  SV = SZ[0],
			  Sm = SZ[1],
			  SY = Object(B4.useState)([]),
			  Sz = Object(B9.a)(SY, 2),
			  SF = Sz[0],
			  SX = Sz[1],
			  SD = Object(B4.useState)(false),
			  Sr = Object(B9.a)(SD, 2),
			  Sl = Sr[0],
			  Sd = Sr[1],
			  Sj = Object(B4.useState)(false),
			  SH = Object(B9.a)(Sj, 2),
			  SI = (SH[0], SH[1]),
			  SR = Object(B4.useState)(false),
			  SA = Object(B9.a)(SR, 2),
			  SL = (SA[0], SA[1]),
			  SJ = Object(B4.useState)(false),
			  SC = Object(B9.a)(SJ, 2),
			  SE = (SC[0], SC[1])
			Object(B4.useEffect)(function () {
			  Ba('getUnitData', {}).then(function (M5) {
				Sm(M5.data)
				SX(M5.data)
				Sd(M5.employed)
			  })
			}, [])
			var SU = function (M4) {
				Sv(M4.currentTarget.id)
			  },
			  SW = function () {
				Sv('')
			  }
			Bi('closeApps', function () {
			  SI(false)
			  SL(false)
			  SE(false)
			})
			var M0 = B5.a.useState(0),
			  M1 = Object(B9.a)(M0, 2),
			  M2 = M1[0],
			  M3 = M1[1]
			return Object(BG.jsx)(BG.Fragment, {
			  children: Object(BG.jsxs)(is, {
				emptyMessage: 0 === SF.length,
				primaryActions: [],
				search: {
				  filter: ['storage_id', 'storage_business', 'storage_size'],
				  list: SV,
				  onChange: SX,
				},
				children: [
				  Object(BG.jsxs)(iY.a, {
					centered: true,
					variant: 'fullWidth',
					value: M2,
					onChange: function (M4, M5) {
					  0 === M5
						? (console.log('tab is 0, fetch owned data'),
						  Ba('getUnitData', {}).then(function (M8) {
							Sm(M8.data)
							SX(M8.data)
							M3(M5)
						  }))
						: 1 === M5 &&
						  (console.log('tab is 1, fetch manage data'),
						  Ba('getManageData', {}).then(function (M8) {
							Sm(M8.data)
							SX(M8.data)
							M3(M5)
						  }))
					},
					'aria-label': 'icon tabs example',
					sx: { display: Sl ? '' : 'none' },
					children: [
					  Object(BG.jsx)(iz.a, { label: 'Owned' }),
					  Object(BG.jsx)(iz.a, { label: 'Manage' }),
					],
				  }),
				  Object(BG.jsx)('div', {
					style: {
					  display: 0 === M2 ? '' : 'none',
					  marginTop: Sl ? '10%' : 'unset',
					},
					children:
					  SF && SF.length > 0
						? SF.map(function (M4) {
							return Object(BG.jsx)(
							  'div',
							  {
								id: M4.id,
								className: 'component-paper cursor-pointer',
								onMouseEnter: SU,
								onMouseLeave: SW,
								children: Object(BG.jsxs)('div', {
								  className: 'main-container',
								  children: [
									Object(BG.jsx)('div', {
									  className: 'image',
									  children: Object(BG.jsx)('i', {
										className:
										  'fas fa-archive fa-w-16 fa-fw fa-3x',
									  }),
									}),
									Object(BG.jsxs)('div', {
									  className: 'details',
									  children: [
										Object(BG.jsx)('div', {
										  className: 'title',
										  children: Object(BG.jsxs)(BO.a, {
											style: {
											  color: '#fff',
											  wordBreak: 'break-word',
											},
											variant: 'body2',
											gutterBottom: true,
											children: [
											  M4.storage_id,
											  ' ',
											  '('.concat(M4.storage_size, ')'),
											  ' ',
											],
										  }),
										}),
										Object(BG.jsx)('div', {
										  className: 'description',
										  children: Object(BG.jsx)('div', {
											className: 'flex-row',
											children: Object(BG.jsxs)(BO.a, {
											  style: {
												color: '#fff',
												wordBreak: 'break-word',
											  },
											  variant: 'body2',
											  gutterBottom: true,
											  children: [
												'Business: ',
												M4.storage_business,
											  ],
											}),
										  }),
										}),
									  ],
									}),
									Object(BG.jsxs)('div', {
									  className:
										Sk.toString() === M4.id.toString()
										  ? 'actions actions-show'
										  : 'actions',
									  children: [
										Object(BG.jsx)(Bg.a, {
										  title: 'Manage Unit',
										  placement: 'top',
										  sx: {
											backgroundColor:
											  'rgba(97, 97, 97, 0.9)',
										  },
										  arrow: true,
										  children: Object(BG.jsx)('div', {
											children: Object(BG.jsx)('i', {
											  id: M4.id,
											  className:
												'fas fa-cog fa-w-16 fa-fw fa-lg',
											}),
										  }),
										}),
										Object(BG.jsx)(Bg.a, {
										  title: 'Pay Unit',
										  placement: 'top',
										  sx: {
											backgroundColor:
											  'rgba(97, 97, 97, 0.9)',
										  },
										  arrow: true,
										  children: Object(BG.jsx)('div', {
											children: Object(BG.jsx)('i', {
											  id: M4.id,
											  className:
												'fas fa-dollar-sign fa-w-16 fa-fw fa-lg',
											}),
										  }),
										}),
										Object(BG.jsx)(Bg.a, {
										  title: 'Set GPS',
										  placement: 'top',
										  sx: {
											backgroundColor:
											  'rgba(97, 97, 97, 0.9)',
										  },
										  arrow: true,
										  children: Object(BG.jsx)('div', {
											children: Object(BG.jsx)('i', {
											  id: M4.id,
											  className:
												'fas fa-map-marker-alt fa-w-16 fa-fw fa-lg',
											}),
										  }),
										}),
									  ],
									}),
								  ],
								}),
							  },
							  M4.id
							)
						  })
						: Object(BG.jsx)(BG.Fragment, {}),
				  }),
				  Object(BG.jsx)('div', {
					style: {
					  display: 1 === M2 && Sl ? '' : 'none',
					  marginTop: '10%',
					},
					children:
					  SF && SF.length > 0
						? SF.map(function (M4) {
							return Object(BG.jsx)(
							  'div',
							  {
								id: M4.id,
								className: 'component-paper cursor-pointer',
								onMouseEnter: SU,
								onMouseLeave: SW,
								children: Object(BG.jsxs)('div', {
								  className: 'main-container',
								  children: [
									Object(BG.jsx)('div', {
									  className: 'image',
									  children: Object(BG.jsx)('i', {
										className:
										  'fas fa-archive fa-w-16 fa-fw fa-3x',
									  }),
									}),
									Object(BG.jsxs)('div', {
									  className: 'details',
									  children: [
										Object(BG.jsx)('div', {
										  className: 'title',
										  children: Object(BG.jsxs)(BO.a, {
											style: {
											  color: '#fff',
											  wordBreak: 'break-word',
											},
											variant: 'body2',
											gutterBottom: true,
											children: [
											  M4.storage_id,
											  ' ',
											  '('.concat(M4.storage_size, ')'),
											  ' ',
											],
										  }),
										}),
										Object(BG.jsx)('div', {
										  className: 'description',
										  children: Object(BG.jsx)('div', {
											className: 'flex-row',
											children: Object(BG.jsxs)(BO.a, {
											  style: {
												color: '#fff',
												wordBreak: 'break-word',
											  },
											  variant: 'body2',
											  gutterBottom: true,
											  children: [
												'Business: ',
												M4.storage_business,
											  ],
											}),
										  }),
										}),
									  ],
									}),
									Object(BG.jsxs)('div', {
									  className:
										Sk.toString() === M4.id.toString()
										  ? 'actions actions-show'
										  : 'actions',
									  children: [
										Object(BG.jsx)(Bg.a, {
										  title: 'Manage Tenant',
										  placement: 'top',
										  sx: {
											backgroundColor:
											  'rgba(97, 97, 97, 0.9)',
										  },
										  arrow: true,
										  children: Object(BG.jsx)('div', {
											children: Object(BG.jsx)('i', {
											  id: M4.id,
											  className:
												'fas fa-user-edit fa-w-16 fa-fw fa-lg',
											}),
										  }),
										}),
										Object(BG.jsx)(Bg.a, {
										  title: 'Remove Tenant',
										  placement: 'top',
										  sx: {
											backgroundColor:
											  'rgba(97, 97, 97, 0.9)',
										  },
										  arrow: true,
										  children: Object(BG.jsx)('div', {
											children: Object(BG.jsx)('i', {
											  id: M4.id,
											  className:
												'fas fa-user-times fa-w-16 fa-fw fa-lg',
											}),
										  }),
										}),
										Object(BG.jsx)(Bg.a, {
										  title: 'Manage Unit',
										  placement: 'top',
										  sx: {
											backgroundColor:
											  'rgba(97, 97, 97, 0.9)',
										  },
										  arrow: true,
										  children: Object(BG.jsx)('div', {
											children: Object(BG.jsx)('i', {
											  id: M4.id,
											  className:
												'fas fa-cog fa-w-16 fa-fw fa-lg',
											}),
										  }),
										}),
										Object(BG.jsx)(Bg.a, {
										  title: 'Set GPS',
										  placement: 'top',
										  sx: {
											backgroundColor:
											  'rgba(97, 97, 97, 0.9)',
										  },
										  arrow: true,
										  children: Object(BG.jsx)('div', {
											children: Object(BG.jsx)('i', {
											  id: M4.id,
											  className:
												'fas fa-map-marker-alt fa-w-16 fa-fw fa-lg',
											}),
										  }),
										}),
									  ],
									}),
								  ],
								}),
							  },
							  M4.id
							)
						  })
						: Object(BG.jsx)(BG.Fragment, {}),
				  }),
				],
			  }),
			})
		  },
		  Sf = Object(i4.a)({
			root: {
			  top: '0px',
			  left: '0px',
			  width: '100vw',
			  height: '100vh',
			  position: 'absolute',
			  maxWidth: '100vw',
			  minWidth: '100vw',
			  maxHeight: '100vh',
			  minHeight: '100vh',
			  pointerEvents: 'none',
			  border: '0px',
			  margin: '0px',
			  outline: '0px',
			  padding: '0px',
			  overflow: 'hidden',
			  '& .MuiInput-root': {
				color: 'white',
				fontSize: '1.3vmin',
			  },
			  '& .MuiInput-underline:hover:not(.Mui-disabled):before': {
				borderColor: 'darkgray',
			  },
			  '& .MuiInput-underline:before': {
				borderColor: 'darkgray',
				color: 'darkgray',
			  },
			  '& .MuiInput-underline:after': {
				borderColor: 'white',
				color: 'darkgray',
			  },
			  '& .MuiInputLabel-animated': {
				color: 'darkgray',
				fontSize: '1.5vmin',
			  },
			  '& .MuiInputAdornment-root': { color: 'darkgray' },
			  '& label.Mui-focused': { color: 'darkgray' },
			},
			input: {
			  '& input[type=number]': { '-moz-appearance': 'textfield' },
			  '& input[type=number]::-webkit-outer-spin-button': {
				'-webkit-appearance': 'none',
				margin: 0,
			  },
			  '& input[type=number]::-webkit-inner-spin-button': {
				'-webkit-appearance': 'none',
				margin: 0,
			  },
			},
			phoneContainer: {
			  top: 'unset',
			  left: 'unset',
			  right: '20px',
			  width: '280px',
			  bottom: '0px',
			  height: '652px',
			  zIndex: '20',
			  position: 'absolute',
			  minWidth: '280px',
			  minHeight: '652px',
			  pointerEvents: 'all',
			  margin: 'unset',
			  overflow: 'hidden',
			  background:
				'url(https://cdn.discordapp.com/attachments/941695751480807494/951465469204922408/download.jpg) 0% 0% / cover no-repeat',
			  transition: 'bottom 800ms ease 0s',
			  borderRadius: '6px',
			  backgroundRepeat: 'no-repeat',
			},
			phoneTopContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '24px',
			  display: 'flex',
			  zIndex: '100',
			  position: 'absolute',
			  minHeight: '24px',
			  userSelect: 'none',
			  justifyContent: 'center',
			},
			phoneTopLeftContainer: {
			  color: '#fff',
			  height: '24px',
			  display: 'flex',
			  padding: '0px 12px',
			  minWidth: '74px',
			  minHeight: '24px',
			  alignItems: 'center',
			  paddingRight: '4px !important',
			},
			phoneTopRightContainer: {
			  color: '#fff',
			  height: '24px',
			  display: 'flex',
			  padding: '0px 12px',
			  minWidth: '74px',
			  minHeight: '24px',
			  alignItems: 'center',
			  justifyContent: 'flex-end',
			},
			phoneTopLeftDivider: {
			  flex: '1 1 0%',
			  marginLeft: '8px',
			},
			phoneTopMiddleContainer: { flex: '1 1 0%' },
			phoneAppInnerContainer: {
			  width: '100%',
			  height: '100%',
			  padding: '0px',
			  overflow: 'hidden scroll',
			  maxHeight: '100%',
			  minHeight: '100%',
			},
			phoneAppApps: {
			  width: '100%',
			  display: 'flex',
			  flexWrap: 'wrap',
			  alignContent: 'flex-start',
			},
			phoneApp: {
			  width: '54px',
			  height: '54px',
			  margin: '8px',
			  display: 'flex',
			  position: 'relative',
			  alignItems: 'center',
			  borderRadius: '14px',
			  justifyContent: 'center',
			},
			wifiConnectModalContainer: {
			  top: '0px',
			  left: '0px',
			  width: '100%',
			  height: '100%',
			  display: 'flex',
			  zIndex: '1000',
			  position: 'absolute',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgba(0, 0, 0, 0.7)',
			},
			wifiConnectModalInnerContainer: {
			  width: 'calc(100% - 64px)',
			  height: 'auto',
			  display: 'flex',
			  padding: '16px',
			  overflow: 'hidden scroll',
			  position: 'relative',
			  maxHeight: '80%',
			  minHeight: '30%',
			  alignItems: 'center',
			  justifyContent: 'center',
			  backgroundColor: 'rgb(48, 71, 94)',
			},
		  }),
		  Sh = Object(Bn.a)({
			components: {
			  MuiMenuItem: {
				styleOverrides: {
				  root: {
					backgroundColor: '#2f2f2f',
					'&.Mui-selected': {
					  backgroundColor: 'rgba(255, 255, 255, 0.08)',
					  '&.Mui-focusVisible': { background: 'rgba(0, 0, 0, 0.24)' },
					},
					'&.Mui-selected:hover': {
					  backgroundColor: 'rgba(255, 255, 255, 0.08)',
					},
				  },
				},
			  },
			  MuiCircularProgress: {
				styleOverrides: { circle: { strokeLinecap: 'butt' } },
			  },
			  MuiInput: {
				styleOverrides: {
				  root: {
					'& .MuiInput-root': {
					  color: 'white',
					  fontSize: '1.3vmin',
					},
					'& label.Mui-focused': { color: 'darkgray' },
					'& .MuiInput-underline:hover:not(.Mui-disabled):before': {
					  borderColor: 'darkgray',
					},
					'& .MuiInput-underline:before': {
					  borderColor: 'darkgray',
					  color: 'darkgray',
					},
					'& .MuiInput-underline:after': {
					  borderColor: 'white',
					  color: 'darkgray',
					},
					'& .Mui-focused:after': {
					  color: 'darkgray',
					  fontSize: '1.5vmin',
					},
					'& .MuiInputAdornment-root': { color: 'darkgray' },
				  },
				},
			  },
			  MuiTooltip: {
				styleOverrides: {
				  tooltip: {
					fontSize: '1em',
					maxWidth: '1000px',
				  },
				},
			  },
			},
			palette: {
			  mode: 'dark',
			  primary: { main: '#95ef77' },
			  secondary: { main: '#424cab' },
			  success: { main: '#95ef77' },
			  warning: { main: '#f2a365' },
			  error: { main: '#ffffff' },
			  info: { main: '#2d465b' },
			},
		  }),
		  Sq = function () {
			var Sc = Sf(),
			  Sx = BT(),
			  Sk = Sx.addNotification,
			  Sv = Sx.deleteNotification,
			  SP = Sx.notifications,
			  SZ = Object(B4.useState)(0),
			  SV = Object(B9.a)(SZ, 2),
			  Sm = SV[0],
			  SY = SV[1],
			  Sz = Object(B4.useState)(false),
			  SF = Object(B9.a)(Sz, 2),
			  SX = SF[0],
			  SD = SF[1],
			  Sr = Object(B4.useState)(false),
			  Sl = Object(B9.a)(Sr, 2),
			  Sd = Sl[0],
			  Sj = Sl[1],
			  SH = Object(BP.c)(Br),
			  SI = Object(B9.a)(SH, 2),
			  SR = (SI[0], SI[1]),
			  SA = Object(B4.useState)(false),
			  SL = Object(B9.a)(SA, 2),
			  SJ = SL[0],
			  SC = SL[1],
			  SE = Object(B4.useState)(0),
			  SU = Object(B9.a)(SE, 2),
			  SW = SU[0],
			  M0 = SU[1],
			  M1 = Object(B4.useState)('00:00'),
			  M2 = Object(B9.a)(M1, 2),
			  M3 = M2[0],
			  M4 = M2[1],
			  M5 = Object(B4.useState)(false),
			  M6 = Object(B9.a)(M5, 2),
			  M7 = M6[0],
			  M8 = M6[1],
			  M9 = Object(B4.useState)(false),
			  MB = Object(B9.a)(M9, 2),
			  Mi = MB[0],
			  MS = MB[1],
			  MM = Object(B4.useState)(false),
			  Mp = Object(B9.a)(MM, 2),
			  Ma = Mp[0],
			  Ms = Mp[1],
			  Mo = Object(B4.useState)(''),
			  MQ = Object(B9.a)(Mo, 2),
			  MO = MQ[0],
			  Mn = MQ[1],
			  MK = Object(B4.useState)(false),
			  Mb = Object(B9.a)(MK, 2),
			  Mg = Mb[0],
			  MT = Mb[1],
			  MN = Object(B4.useState)(false),
			  MG = Object(B9.a)(MN, 2),
			  My = MG[0],
			  Mu = MG[1],
			  Mf = Object(B4.useState)(false),
			  Mh = Object(B9.a)(Mf, 2),
			  Mq = Mh[0],
			  Mw = Mh[1],
			  Mc = Object(B4.useState)(''),
			  Mx = Object(B9.a)(Mc, 2),
			  Mk = Mx[0],
			  Mv = Mx[1],
			  MP = Object(B4.useState)(false),
			  MZ = Object(B9.a)(MP, 2),
			  MV = MZ[0],
			  Mm = MZ[1],
			  MY = Object(B4.useState)(false),
			  Mz = Object(B9.a)(MY, 2),
			  MF = (Mz[0], Mz[1]),
			  MX = Object(BP.c)(BI),
			  MD = Object(B9.a)(MX, 2),
			  Mr = MD[0],
			  Ml = MD[1],
			  Md = Object(BP.c)(BR),
			  Mj = Object(B9.a)(Md, 2),
			  MH = Mj[0],
			  MI = Mj[1],
			  MR = Object(BP.c)(BA),
			  MA = Object(B9.a)(MR, 2),
			  ML = MA[0],
			  MJ = MA[1],
			  MC = Object(BP.c)(BL),
			  ME = Object(B9.a)(MC, 2),
			  MU = ME[0],
			  MW = ME[1],
			  p0 = Object(BP.c)(BJ),
			  p1 = Object(B9.a)(p0, 2),
			  p2 = p1[0],
			  p3 = p1[1],
			  p4 = Object(BP.c)(BC),
			  p5 = Object(B9.a)(p4, 2),
			  p6 = (p5[0], p5[1]),
			  p7 = Object(BP.c)(Bl),
			  p8 = Object(B9.a)(p7, 2),
			  p9 = p8[0],
			  pB = p8[1],
			  pi = Object(BP.c)(Bd),
			  pS = Object(B9.a)(pi, 2),
			  pM = (pS[0], pS[1])
			Object(B4.useEffect)(function () {
			  window.invokeNative || SD(true)
			})
			Bi('openPhone', function (ps) {
			  SD(ps.bool)
			  M0(ps.serverid)
			  MS(ps.hiddenapp)
			  SC(ps.hasDongle)
			  SR(ps.hasVPN)
			  Mm(ps.notifications)
			})
			Bi('closePhone', function (ps) {
			  SD(false)
			})
			Bi('setTime', function (ps) {
			  M4(ps)
			})
			Bi('setSrc', function (ps) {
			  M0(ps)
			})
			Bi('handleWifi', function (ps) {
			  true === ps.show ? (M8(true), MS(false)) : (M8(false), MS(false))
			})
			Bi('toggleDevmode', function (ps) {
			  true === ps.bool ? Sj(true) : Sj(false)
			})
			var pp = Object(BQ.f)()
			Bi('closeApps', function () {
			  pp.push('/')
			  Mn('')
			  Ms(false)
			  Mw(false)
			  MT(false)
			  Mu(false)
			  MF(false)
			  Mv('home')
			})
			var pa = function (ps) {
			  {
				var pQ = ('' + ps)
				  .replace(/\D/g, '')
				  .match(/^(\d{3})(\d{3})(\d{4})$/)
				return pQ ? '(' + pQ[1] + ') ' + pQ[2] + '-' + pQ[3] : ps
			  }
			}
			return (
			  Bi('setPreferences', function (ps) {
				undefined !== ps['phone.misc.brand']
				  ? Ml(ps['phone.misc.brand'])
				  : Ml('android')
				undefined !== ps['phone.misc.background']
				  ? MI(ps['phone.misc.background'])
				  : MI('https://i.imgur.com/3KTfLIV.jpg')
				undefined !== ps['phone.misc.receive.sms'] &&
				  MJ(ps['phone.misc.receive.sms'])
				undefined !== ps['phone.misc.new.tweet'] &&
				  MW(ps['phone.misc.new.tweet'])
				undefined !== ps['phone.misc.receive.email'] &&
				  p3(ps['phone.misc.receive.email'])
				undefined !== ps['phone.misc.embedded.images'] &&
				  p6(ps['phone.misc.embedded.images'])
			  }),
			  Bi('setNotify', function (ps) {
				{
				  var pQ = ps.data
				  if ((M0(ps.serverid), 'phone' === ps.app)) {
					switch (pQ.action) {
					  case 'notification':
						switch (pQ.target_app) {
						  case 'twitter':
							if ('twitter' === Mk && !pQ.show_even_if_app_active) {
							  return
							}
							if (!MU) {
							  return
							}
							Sk({
							  id: Sm,
							  isCall: false,
							  calls: {
								receive: false,
								dialing: false,
								progress: false,
								inactive: false,
							  },
							  isConfirmation: false,
							  confirmation: {},
							  header: pQ.title,
							  content: pQ.body,
							  isPerma: false,
							  cancelButton: false,
							  jobGroupId: 0,
							  icon: 'fab fa-twitter',
							  iconColor: '#fff',
							  bgColor: '#0eabef',
							})
							break
						  case 'messages':
							if (!ML) {
							  return
							}
							Sk({
							  id: Sm,
							  isCall: false,
							  calls: {
								receive: false,
								dialing: false,
								progress: false,
								inactive: false,
							  },
							  isConfirmation: false,
							  confirmation: {},
							  header: pa(pQ.title),
							  content: pQ.body,
							  isPerma: false,
							  cancelButton: false,
							  jobGroupId: 0,
							  icon: 'fas fa-comment',
							  iconColor: '#fff',
							  bgColor: '#8dc348',
							})
							break
						  case 'email':
							if (!p2) {
							  return
							}
							Sk({
							  id: Sm,
							  isCall: false,
							  calls: {
								receive: false,
								dialing: false,
								progress: false,
								inactive: false,
							  },
							  isConfirmation: false,
							  confirmation: {},
							  header: pQ.title,
							  content: pQ.body,
							  isPerma: false,
							  cancelButton: false,
							  jobGroupId: 0,
							  icon: 'fas fa-envelope-open',
							  iconColor: '#fff',
							  bgColor:
								'linear-gradient(0deg, rgba(114,213,227,1) 0%, rgba(0,140,237,1) 100%)',
							})
							break
						  case 'home-screen':
							Sk({
							  id: Sm,
							  isCall: false,
							  calls: {
								receive: false,
								dialing: false,
								progress: false,
								inactive: false,
							  },
							  isConfirmation: false,
							  confirmation: {},
							  header: pQ.title,
							  content: pQ.body,
							  isPerma: false,
							  cancelButton: false,
							  jobGroupId: 0,
							  icon: 'fas fa-home',
							  iconColor: '#fff',
							  bgColor: pQ.bgColor,
							})
						}
						break
					  case 'call-receiving':
						var pO = (function (pN) {
							{
							  for (
								var py = '',
								  pu = '0123456789',
								  pf = pu.length,
								  ph = 0;
								ph < pN;
								ph++
							  ) {
								py += pu.charAt(Math.floor(Math.random() * pf))
							  }
							  return py
							}
						  })(4),
						  pn = pa(pQ.name),
						  pK = BU()().unix(),
						  pb = p9,
						  pg = {
							id: pO,
							number: pQ.number,
							name: pn,
							date: pK,
							state: 'in',
						  },
						  pT = [].concat(Object(B8.a)(pb || []), [pg])
						pB(pT),
						  pM(pT),
						  Sk({
							id: Sm,
							isCall: true,
							calls: {
							  callId: pQ.callId,
							  receive: true,
							  dialing: false,
							  progress: false,
							  inactive: true,
							},
							isConfirmation: false,
							confirmation: {},
							header: pa(pQ.name),
							content: 'Incoming Call',
							isPerma: true,
							cancelButton: false,
							jobGroupId: 0,
							icon: 'fas fa-phone',
							iconColor: '#fff',
							bgColor: 'rgb(0, 150, 136)',
						  })
						break
					  case 'call-in-progress':
						Sk({
						  id: Sm,
						  isCall: true,
						  calls: {
							callId: pQ.callId,
							receive: false,
							dialing: false,
							progress: true,
							inactive: false,
						  },
						  isConfirmation: false,
						  confirmation: {},
						  header: pa(pQ.number),
						  content: '00:00',
						  isPerma: true,
						  cancelButton: false,
						  jobGroupId: 0,
						  icon: 'fas fa-phone',
						  iconColor: '#fff',
						  bgColor: 'rgb(0, 150, 136)',
						})
						break
					  case 'call-dialing':
						Sk({
						  id: Sm,
						  isCall: true,
						  calls: {
							callId: pQ.callId,
							receive: false,
							dialing: true,
							progress: false,
							inactive: false,
						  },
						  isConfirmation: false,
						  confirmation: {},
						  header: pa(pQ.number),
						  content: 'Dialing...',
						  isPerma: true,
						  cancelButton: false,
						  jobGroupId: 0,
						  icon: 'fas fa-phone',
						  iconColor: '#fff',
						  bgColor: 'rgb(0, 150, 136)',
						})
						break
					  case 'call-inactive':
						Sk({
						  id: Sm,
						  isCall: false,
						  calls: {
							receive: false,
							dialing: false,
							progress: false,
							inactive: true,
						  },
						  isConfirmation: false,
						  confirmation: {},
						  header: pa(pQ.number),
						  content: 'Disconnected!',
						  isPerma: false,
						  cancelButton: false,
						  jobGroupId: 0,
						  icon: 'fas fa-phone',
						  iconColor: '#fff',
						  bgColor: 'rgb(0, 150, 136)',
						})
						break
					  case 'generic-confirmation':
						if ('home-screen' === pQ.appName) {
						  Sk({
							id: Sm,
							isCall: false,
							calls: {
							  receive: false,
							  dialing: false,
							  progress: false,
							  inactive: false,
							},
							isConfirmation: true,
							confirmation: {
							  id: pQ._data.confirmationId,
							  onAccept: pQ.onAccept,
							  onReject: pQ.onReject,
							  timeOut: pQ.timeOut,
							},
							header: pQ.title,
							content: pQ.text,
							isPerma: false,
							cancelButton: false,
							jobGroupId: 0,
							icon: 'fas fa-'.concat(pQ.icon.name),
							iconColor: pQ.icon.color,
							bgColor: pQ.bgColor,
						  })
						}
						break
					  case 'job-notification':
						Sk({
						  id: Sm,
						  isCall: false,
						  calls: {
							receive: false,
							dialing: false,
							progress: false,
							inactive: false,
						  },
						  isConfirmation: false,
						  confirmation: {},
						  header: pQ.title,
						  content: pQ.text,
						  isPerma: true,
						  cancelButton: pQ.cancelButton,
						  jobGroupId: pQ.jobGroupId,
						  icon: 'fas fa-'.concat(pQ.icon.name),
						  iconColor: pQ.icon.color,
						  bgColor: pQ.bgColor,
						})
						break
					  case 'racing-alias-set':
						Sk({
						  id: Sm,
						  isCall: false,
						  calls: {
							receive: false,
							dialing: false,
							progress: false,
							inactive: false,
						  },
						  isConfirmation: false,
						  confirmation: {},
						  header: pQ.title,
						  content: pQ.text,
						  isPerma: false,
						  cancelButton: false,
						  jobGroupId: 0,
						  icon: 'fas fa-flag-checkered',
						  iconColor: '#fff',
						  bgColor: '#177330',
						})
					}
				  }
				  SY(Sm + 1)
				  'job-notification' === pQ.action &&
					Ba('setJobNotifcationId', { id: Sm })
				}
			  }),
			  ((function (ps) {
				var pQ = Object(B4.useRef)(BB)
				Object(B4.useEffect)(
				  function () {
					pQ.current = ps
				  },
				  [ps]
				)
				Object(B4.useEffect)(function () {
				  var pO = function (pn) {
					Bo.includes(pn.code) && (pQ.current(false), Ba('hideFrame'))
				  }
				  return (
					window.addEventListener('keydown', pO),
					function () {
					  return window.removeEventListener('keydown', pO)
					}
				  )
				}, [])
			  })(SD),
			  Object(BG.jsx)('div', {
				className: 'App',
				children: Object(BG.jsx)(BK.a, {
				  theme: Sh,
				  children: Object(BG.jsxs)(Bb.a, {
					container: true,
					className: Sc.root,
					children: [
					  Object(BG.jsxs)('div', {
						className: Sc.phoneContainer,
						style: {
						  bottom: SX ? '12px' : SP.length ? '-540px' : '-1000px',
						  background: 'url('.concat(
							MH,
							') 0% 0% / cover no-repeat'
						  ),
						},
						children: [
						  ' ',
						  Object(BG.jsxs)('div', {
							className: 'notch',
							style: {
							  display: 'ios' === Mr ? '' : 'none',
							  zIndex: '505',
							},
							children: [
							  Object(BG.jsx)('div', { className: 'camera' }),
							  Object(BG.jsx)('div', { className: 'speaker' }),
							],
						  }),
						  Object(BG.jsxs)('div', {
							className: Sc.phoneTopContainer,
							style: { zIndex: 501 },
							children: [
							  Object(BG.jsxs)('div', {
								className: Sc.phoneTopLeftContainer,
								children: [
								  Object(BG.jsx)(BO.a, {
									style: {
									  wordBreak: 'break-word',
									  fontSize: '0.75rem',
									  lineHeight: '0',
									  textShadow:
										'rgb(55 71 79) -1px 1px 0px, rgb(55 71 79) 1px 1px 0px, rgb(55 71 79) 1px -1px 0px, rgb(55 71 79) -1px -1px 0px',
									},
									variant: 'body2',
									gutterBottom: true,
									children: M3,
								  }),
								  Object(BG.jsx)('div', {
									className: Sc.phoneTopLeftDivider,
									children: Object(BG.jsxs)(BO.a, {
									  style: {
										textAlign: 'right',
										fontSize: '0.75rem',
										lineHeight: '0',
										textShadow:
										  'rgb(55 71 79) -1px 1px 0px, rgb(55 71 79) 1px 1px 0px, rgb(55 71 79) 1px -1px 0px, rgb(55 71 79) -1px -1px 0px',
									  },
									  variant: 'body2',
									  gutterBottom: true,
									  children: ['#', SW],
									}),
								  }),
								],
							  }),
							  Object(BG.jsx)('div', {
								className: Sc.phoneTopMiddleContainer,
							  }),
							  Object(BG.jsxs)('div', {
								className: Sc.phoneTopRightContainer,
								children: [
								  Object(BG.jsx)('i', {
									className: 'fas fa-sun fa-w-16 fa-fw fa-sm',
									style: {
									  WebkitTextStrokeColor: 'black',
									  WebkitTextStrokeWidth: '0.3px',
									  marginLeft: '4px',
									},
								  }),
								  Object(BG.jsx)('i', {
									className:
									  'fas fa-unlock fa-w-14 fa-fw fa-sm',
									style: {
									  WebkitTextStrokeColor: 'black',
									  WebkitTextStrokeWidth: '0.3px',
									  marginLeft: '4px',
									  color: 'rgb(96, 125, 139)',
									},
								  }),
								  Object(BG.jsx)('i', {
									onClick: function () {
									  M7 && Ms(true)
									},
									className: 'fas fa-'.concat(
									  M7 ? 'wifi' : 'signal',
									  ' fa-w-20 fa-fw fa-sm'
									),
									style: {
									  WebkitTextStrokeColor: 'black',
									  WebkitTextStrokeWidth: '0.3px',
									  marginLeft: '4px',
									},
								  }),
								],
							  }),
							],
						  }),
						  Object(BG.jsxs)('div', {
							className: 'phone-bottom-container',
							style: { zIndex: 501 },
							children: [
							  Object(BG.jsx)('div', {
								children: Object(BG.jsx)(Bg.a, {
								  title: 'Toggle Sounds',
								  placement: 'top',
								  sx: {
									backgroundColor: 'rgba(97, 97, 97, 0.9)',
									fontSize: '1em',
									maxWdith: '1000px',
								  },
								  arrow: true,
								  children: Object(BG.jsx)('i', {
									onClick: function () {
									  Ba('toggleNotifications', {}).then(
										function (pQ) {
										  Mm(pQ)
										}
									  )
									},
									className: 'fas '.concat(
									  MV ? 'fa-bell-slash' : 'fa-bell',
									  ' fa-w-14 fa-fw fa-sm'
									),
								  }),
								}),
							  }),
							  Object(BG.jsx)('div', {
								children: Object(BG.jsx)(Bg.a, {
								  title: 'Selfie!',
								  placement: 'top',
								  sx: {
									backgroundColor: 'rgba(97, 97, 97, 0.9)',
									fontSize: '1em',
									maxWdith: '1000px',
								  },
								  arrow: true,
								  children: Object(BG.jsx)('i', {
									onClick: function () {
									  Ba('activateSelfieMode')
									},
									className:
									  'fas fa-camera fa-w-16 fa-fw fa-sm',
								  }),
								}),
							  }),
							  Object(BG.jsx)(Bq.b, {
								to: '/',
								style: {
								  color: '#fff',
								  textDecoration: 'none',
								},
								children: Object(BG.jsx)('div', {
								  onClick: function () {
									pp.push('/')
									Mn('')
									Ms(false)
									Mw(false)
									MT(false)
									Mu(false)
									Mv('home')
								  },
								  children: Object(BG.jsx)(Bg.a, {
									title: 'Home',
									placement: 'top',
									sx: {
									  backgroundColor: 'rgba(97, 97, 97, 0.9)',
									  fontSize: '1em',
									  maxWdith: '1000px',
									},
									arrow: true,
									children: Object(BG.jsx)('i', {
									  className:
										'far fa-circle fa-w-16 fa-fw fa-lg',
									}),
								  }),
								}),
							  }),
							  Object(BG.jsx)('div', {
								children: Object(BG.jsx)(Bg.a, {
								  title: 'Switch Orientation',
								  placement: 'top',
								  sx: {
									backgroundColor: 'rgba(97, 97, 97, 0.9)',
									fontSize: '1em',
									maxWdith: '1000px',
								  },
								  arrow: true,
								  children: Object(BG.jsx)('i', {
									className:
									  'fas fa-sync-alt fa-w-16 fa-fw fa-sm',
								  }),
								}),
							  }),
							  Object(BG.jsx)('div', {
								children: Object(BG.jsx)(Bg.a, {
								  title: 'Explorer',
								  placement: 'top',
								  sx: {
									backgroundColor: 'rgba(97, 97, 97, 0.9)',
								  },
								  arrow: true,
								  children: Object(BG.jsx)('i', {
									className:
									  'fab fa-internet-explorer fa-w-16 fa-fw fa-sm',
								  }),
								}),
							  }),
							],
						  }),
						  Object(BG.jsx)('div', {
							className:
							  'top-notifications-wrapper top-notifications-wrapper-mounted',
							style: {
							  zIndex: 501,
							  display: SP.length ? '' : 'none',
							},
							children: SP.map(function (ps) {
							  return Object(BG.jsx)(
								Bh,
								{
								  deleteNotification: Sv,
								  notification: ps,
								},
								ps.id
							  )
							}),
						  }),
						  Object(BG.jsx)('div', {
							className:
							  'top-notifications-wrapper top-notifications-wrapper-mounted',
							style: {
							  maxHeight: '80px',
							  display: 'none',
							},
						  }),
						  Object(BG.jsx)('div', {
							className: Sc.wifiConnectModalContainer,
							style: { display: Ma ? '' : 'none' },
							children: Object(BG.jsxs)('div', {
							  className: Sc.wifiConnectModalInnerContainer,
							  children: [
								Object(BG.jsx)('div', {
								  className: 'spinner-wrapper',
								  style: { display: Mg ? '' : 'none' },
								  children: Object(BG.jsxs)('div', {
									className: 'lds-spinner',
									children: [
									  Object(BG.jsx)('div', {}),
									  Object(BG.jsx)('div', {}),
									  Object(BG.jsx)('div', {}),
									  Object(BG.jsx)('div', {}),
									  Object(BG.jsx)('div', {}),
									  Object(BG.jsx)('div', {}),
									  Object(BG.jsx)('div', {}),
									  Object(BG.jsx)('div', {}),
									  Object(BG.jsx)('div', {}),
									  Object(BG.jsx)('div', {}),
									  Object(BG.jsx)('div', {}),
									  Object(BG.jsx)('div', {}),
									],
								  }),
								}),
								Object(BG.jsx)('div', {
								  className: 'spinner-wrapper',
								  style: { display: My ? '' : 'none' },
								  children: Object(BG.jsx)(Bv.Checkmark, {
									size: '56px',
									color: '#009688',
								  }),
								}),
								Object(BG.jsxs)('div', {
								  className: 'component-simple-form',
								  style: { display: Mq ? 'none' : '' },
								  children: [
									Object(BG.jsx)('div', {
									  children: Object(BG.jsx)('div', {
										className: 'input-wrapper',
										children: Object(BG.jsx)(Bw.a, {
										  fullWidth: true,
										  sx: { width: '100%' },
										  children: Object(BG.jsx)(Bc.a, {
											id: 'input-with-icon-textfield',
											label: 'Password',
											variant: 'standard',
											onChange: function (ps) {
											  Mn(ps.target.value)
											},
											value: MO,
											InputProps: {
											  startAdornment: Object(BG.jsx)(
												Bx.a,
												{
												  position: 'start',
												  children: Object(BG.jsx)('i', {
													className: 'fas fa-user-lock',
												  }),
												}
											  ),
											},
										  }),
										}),
									  }),
									}),
									Object(BG.jsxs)('div', {
									  className: 'buttons',
									  children: [
										Object(BG.jsx)('div', {
										  children: Object(BG.jsx)(Bk.a, {
											onClick: function () {
											  Ms(false)
											},
											size: 'small',
											color: 'warning',
											variant: 'contained',
											children: 'Cancel',
										  }),
										}),
										Object(BG.jsx)('div', {
										  children: Object(BG.jsx)(Bk.a, {
											onClick: function () {
											  MT(true)
											  Mw(true)
											  Ba('connectWifi', {}).then(
												function (pQ) {
												  MS(true)
												  setTimeout(function () {
													MT(false)
													Mu(true)
													setTimeout(function () {
													  Mu(false)
													  Ms(false)
													  Mw(false)
													}, 1500)
												  }, 500)
												}
											  )
											},
											size: 'small',
											color: 'success',
											variant: 'contained',
											children: 'Submit',
										  }),
										}),
									  ],
									}),
								  ],
								}),
							  ],
							}),
						  }),
						  Object(BG.jsx)('div', {
							className: 'phone-app-container',
							style: { background: 'rgba(0, 0, 0, 0)' },
							children: Object(BG.jsx)('div', {
							  className: Sc.phoneAppInnerContainer,
							  children: Object(BG.jsxs)('div', {
								className: Sc.phoneAppApps,
								children: [
								  Object(BG.jsx)(Bq.b, {
									to: '/information',
									onClick: function () {
									  return Mv('information')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Information',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#fff',
										  background:
											'linear-gradient(356deg, rgba(0,132,255,1) 9%, rgba(75,181,255,1) 55%)',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/details.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/contacts',
									onClick: function () {
									  return Mv('contacts')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Contacts',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#fff',
										  background:
											'linear-gradient(356deg, rgba(0,44,74,1) 9%, rgba(0,65,110,1) 55%)',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/contacts.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/calls',
									onClick: function () {
									  return Mv('calls')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Calls',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#fff',
										  background:
											'linear-gradient(0deg, rgb(60, 194, 122) 0%, rgba(5,136,66,1) 100%)',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/calls.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/messages',
									onClick: function () {
									  return Mv('messages')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Messages',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsxs)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#fff',
										  background:
											'linear-gradient(0deg, rgba(0,182,21,1) 0%, rgba(128,236,109,1) 100%)',
										},
										children: [
										  Object(BG.jsx)('img', {
											alt: 'useful',
											style: {
											  height: '54px',
											  borderRadius: '14px',
											},
											src: 'https://gta-assets.nopixel.net/images/phone-icons/conversations.png',
										  }),
										  Object(BG.jsx)('div', {
											className: 'app-notification',
											style: { display: 'none' },
										  }),
										],
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/erpinger',
									onClick: function () {
									  return Mv('erpinger')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Ping!',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#fff',
										  background:
											'linear-gradient(0deg, rgba(72,105,255,1) 0%, rgba(121,37,255,1) 100%)',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/erpinger.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/email',
									onClick: function () {
									  return Mv('email')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Email',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#fff',
										  background:
											'linear-gradient(0deg, rgba(114,213,227,1) 0%, rgba(0,140,237,1) 100%)',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/email.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/yp',
									onClick: function () {
									  return Mv('yp')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'YP',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#fff',
										  background:
											'linear-gradient(0deg, rgba(255,191,0,1) 0%, rgba(255,191,0,1) 100%)',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/yellow-pages.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/twitter',
									onClick: function () {
									  return Mv('twitter')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Twatter',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#fff',
										  background:
											'linear-gradient(0deg, rgba(23,23,23,1) 0%, rgba(23,23,23,1) 100%)',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/twatter.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/garage',
									onClick: function () {
									  return Mv('garage')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Vehicles',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#fff',
										  background:
											'linear-gradient(180deg, rgba(233, 108, 123, 1) 0%, rgba(209, 13, 53, 1) 100%)',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/vehicles.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/debt',
									onClick: function () {
									  return Mv('debt')
									},
									style: {
									  
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Debt',
									  placement: 'top',
									  sx: {
										
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  
										  color: '#fff',
										  background: '#faf8fb',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/debt.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/wenmo',
									onClick: function () {
									  return Mv('wenmo')
									},
									style: {
									  
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Wenmo',
									  placement: 'top',
									  sx: {
										
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  
										  color: '#fff',
										  background: '#151718',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/wenmo.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/documents',
									onClick: function () {
									  return Mv('documents')
									},
									style: {
									  
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Documents',
									  placement: 'top',
									  sx: {
										
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  
										  color: '#fff',
										  background: '#da54d5',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/documents.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/housing',
									onClick: function () {
									  return Mv('housing')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Housing',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#fff',
										  background:
											'linear-gradient(0deg, rgba(61,146,69,1) 0%, rgba(61,146,69,1) 100%)',
										},
										children: Object(BG.jsx)('i', {
										  className:
											'fas fa-house-user fa-w-16 fa-fw',
										  style: {
											fontSize: '40px',
											WebkitTextStrokeColor:
											  'rgb(34, 40, 49)',
											WebkitTextStrokeWidth: '0.9px',
										  },
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/crypto',
									onClick: function () {
									  return Mv('crypto')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Crypto',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#fff',
										  background: '#121315',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/crypto.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/jobs',
									onClick: function () {
									  return Mv('jobs')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Job Center',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#fff',
										  background: '#1d1d1d',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/jobs.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/employment',
									onClick: function () {
									  return Mv('employment')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Employment',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#fff',
										  background: '#1d1d1d',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/employment.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/racing',
									onClick: function () {
									  return Mv('racing')
									},
									style: {
									  display: SJ ? '' : 'none',
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Racing',
									  placement: 'top',
									  sx: {
										display: SJ ? '' : 'none',
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  display: SJ ? '' : 'none',
										  color: '#fff',
										  background: '#fe7228',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/racing.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/calculator',
									onClick: function () {
									  return Mv('calculator')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Calculator',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#fff',
										  background:
											'linear-gradient(180deg, rgba(233, 108, 123, 1) 0%, rgba(209, 13, 53, 1) 100%)',
										},
										children: Object(BG.jsx)('img', {
										  alt: 'useful',
										  style: {
											height: '54px',
											borderRadius: '14px',
										  },
										  src: 'https://gta-assets.nopixel.net/images/phone-icons/calculator.png',
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/doj',
									onClick: function () {
									  return Mv('doj')
									},
									style: {
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Department of Justice',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  color: '#dfcf0d',
										  background:
											'linear-gradient(0deg, rgba(63,88,187,1) 0%, rgba(63,88,187,1) 100%)',
										},
										children: Object(BG.jsx)('i', {
										  className: 'fas fa-gavel fa-w-16 fa-fw',
										  style: { fontSize: '40px' },
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/sportsbook',
									onClick: function () {
									  return Mv('sportsbook')
									},
									style: {
									  
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'Diamond Sports Book',
									  placement: 'top',
									  sx: {
										
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  
										  color: '#fff',
										  background:
											'linear-gradient(0deg, rgba(0,0,2,1) 0%, rgba(0,0,2,1) 100%)',
										},
										children: Object(BG.jsx)('i', {
										  className: 'fas fa-gem fa-w-16 fa-fw',
										  style: { fontSize: '40px' },
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/paynless',
									onClick: function () {
									  return Mv('paynless')
									},
									style: {
									  
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  title: 'PayNLess',
									  placement: 'top',
									  sx: {
										
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  
										  color: '#fff',
										  background: '#1d1d1d',
										},
										children: Object(BG.jsx)('i', {
										  className:
											'fas fa-archive fa-w-16 fa-fw',
										  style: {
											fontSize: '35px',
											WebkitTextStrokeColor:
											  'rgb(34, 40, 49)',
											WebkitTextStrokeWidth: '0.9px',
										  },
										}),
									  }),
									}),
								  }),
								  Object(BG.jsx)(Bq.b, {
									to: '/darkmarket',
									onClick: function () {
									  return Mv('darkmarket')
									},
									style: {
									  display: M7 && Mi ? '' : 'none',
									  color: '#fff',
									  textDecoration: 'none',
									},
									children: Object(BG.jsx)(Bg.a, {
									  style: { display: M7 && Mi ? '' : 'none' },
									  title: 'Dark Market',
									  placement: 'top',
									  sx: {
										backgroundColor: 'rgba(97, 97, 97, 0.9)',
										fontSize: '1em',
										maxWdith: '1000px',
									  },
									  arrow: true,
									  children: Object(BG.jsx)('div', {
										className: Sc.phoneApp,
										style: {
										  display: M7 && Mi ? '' : 'none',
										  color: '#fff',
										  background:
											'linear-gradient(to bottom, #c852ff, #a21de0)',
										},
										children: Object(BG.jsx)('i', {
										  className:
											'fas fa-user-secret fa-w-16 fa-fw',
										  style: { fontSize: '40px' },
										}),
									  }),
									}),
								  }),
								],
							  }),
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/information',
							  render: function () {
								return Object(BG.jsx)(i6, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/contacts',
							  render: function () {
								return Object(BG.jsx)(io, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/calls',
							  render: function () {
								return Object(BG.jsx)(iO, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/messages',
							  render: function () {
								return Object(BG.jsx)(SB, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/chat/:chatId',
							  render: function () {
								return Object(BG.jsx)(SM, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/erpinger',
							  render: function () {
								return Object(BG.jsx)(ib, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/email',
							  render: function () {
								return Object(BG.jsx)(iT, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/yp',
							  render: function () {
								return Object(BG.jsx)(iG, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/twitter',
							  render: function () {
								return Object(BG.jsx)(iq, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/garage',
							  render: function () {
								return Object(BG.jsx)(ik, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/debt',
							  render: function () {
								return Object(BG.jsx)(Sa, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/wenmo',
							  render: function () {
								return Object(BG.jsx)(So, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/documents',
							  render: function () {
								return Object(BG.jsx)(im, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/housing',
							  render: function () {
								return Object(BG.jsx)(iD, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/crypto',
							  render: function () {
								return Object(BG.jsx)(id, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/jobs',
							  render: function () {
								return Object(BG.jsx)(S2, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/employment',
							  render: function () {
								return Object(BG.jsx)(S5, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/employees/:businessId',
							  render: function () {
								return Object(BG.jsx)(S8, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/racing',
							  render: function () {
								return Object(BG.jsx)(iL, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/calculator',
							  render: function () {
								return Object(BG.jsx)(SO, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/doj',
							  render: function () {
								return Object(BG.jsx)(Sg, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/sportsbook',
							  render: function () {
								return Object(BG.jsx)(SG, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/paynless',
							  render: function () {
								return Object(BG.jsx)(Su, {})
							  },
							}),
						  }),
						  Object(BG.jsx)(BQ.c, {
							children: Object(BG.jsx)(BQ.a, {
							  path: '/darkmarket',
							  render: function () {
								return Object(BG.jsx)(S4, {})
							  },
							}),
						  }),
						],
					  }),
					  Object(BG.jsxs)('div', {
						className: 'phone-border-container',
						style: {
						  display: 'android' === Mr ? '' : 'none',
						  bottom:
							'android' === Mr && SX
							  ? '12px'
							  : SP.length
							  ? '-540px'
							  : '-1000px',
						},
						children: [
						  ' ',
						  Object(BG.jsxs)('div', {
							className: 'phone-border-inner-container',
							children: [
							  Object(BG.jsx)('div', {
								className: 'phone-border-inner-border',
							  }),
							  Object(BG.jsx)('div', {
								className: 'phone-border-inner-alignment',
								children: Object(BG.jsx)('div', {
								  className: 'phone-border-inner-white',
								}),
							  }),
							],
						  }),
						],
					  }),
					  Object(BG.jsx)('div', {
						className: 'phone-iphone-shell',
						style: {
						  display: 'ios' === Mr ? '' : 'none',
						  bottom:
							'ios' === Mr && SX
							  ? '0px'
							  : SP.length
							  ? '-550px'
							  : '-1000px',
						},
						children: Object(BG.jsx)('div', {
						  className: 'jss1264',
						  children: Object(BG.jsxs)('div', {
							className: 'jss16465',
							id: 'cores',
							children: [
							  Object(BG.jsx)('div', { className: 'jss16471' }),
							  Object(BG.jsx)('div', { className: 'jss16472' }),
							  Object(BG.jsx)('div', { className: 'jss16473' }),
							  Object(BG.jsx)('div', { className: 'jss16474' }),
							  Object(BG.jsx)('div', {
								className: 'jss16475',
								children: Object(BG.jsx)('div', {
								  className: 'inner-shadow-bg',
								}),
							  }),
							],
						  }),
						}),
					  }),
					],
				  }),
				}),
			  }))
			)
		  }
		B2(170)
		B2(171)
		B2(172)
		B2(173)
		B7.a.render(
		  Object(BG.jsx)(Bq.a, {
			basename: '/',
			children: Object(BG.jsx)(BP.a, { children: Object(BG.jsx)(Sq, {}) }),
		  }),
		  document.getElementById('root')
		)
	  },
	  19: function (S, M, p) {},
	},
	[[174, 1, 2]],
  ])
  