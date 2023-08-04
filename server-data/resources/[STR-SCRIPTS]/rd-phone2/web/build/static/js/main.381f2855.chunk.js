;(this.webpackJsonpweb = this.webpackJsonpweb || []).push([
    [0],
    {
      163: function (P, V, b) {},
      177: function (O0, O1, O2) {
        'use strict'
        O2.r(O1)
        var O4 = O2(1),
          O5 = O2.n(O4),
          O6 = O2(46),
          O7 = O2.n(O6),
          O8 = (O2(163), O2(15)),
          O9 = O2(3),
          OO = (O2(19), function () {}),
          OA = function (Pd, Pi) {
            var Po = Object(O4.useRef)(OO)
            Object(O4.useEffect)(
              function () {
                Po.current = Pi
              },
              [Pi]
            )
            Object(O4.useEffect)(
              function () {
                var PC = function (PS) {
                  var PT = PS.data,
                    PX = PT.action,
                    Pv = PT.data
                  Po.current && PX === Pd && Po.current(Pv)
                }
                return (
                  window.addEventListener('message', PC),
                  function () {
                    return window.removeEventListener('message', PC)
                  }
                )
              },
              [Pd]
            )
          },
          OP = O2(51),
          OV = O2(94)
        function Ob(Pd, Pi) {
          return OB.apply(this, arguments)
        }
        function OB() {
          return (OB = Object(OV.a)(
            Object(OP.a)().mark(function Pi(PD, Po) {
              var PC, PS, PT, PX
              return Object(OP.a)().wrap(function (Pv) {
                for (;;) {
                  switch ((Pv.prev = Pv.next)) {
                    case 0:
                      return (
                        (PC = {
                          method: 'post',
                          headers: {
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: JSON.stringify(Po),
                        }),
                        (PS = window.GetParentResourceName
                          ? window.GetParentResourceName()
                          : 'nui-frame-app'),
                        (Pv.next = 4),
                        fetch('https://'.concat(PS, '/').concat(PD), PC)
                      )
                    case 4:
                      return (PT = Pv.sent), (Pv.next = 7), PT.json()
                    case 7:
                      return (PX = Pv.sent), Pv.abrupt('return', PX)
                    case 9:
                    case 'end':
                      return Pv.stop()
                  }
                }
              }, Pi)
            })
          )).apply(this, arguments)
        }
        var Oh = ['Escape'],
          Ok = O2(27),
          OE = O2(85),
          Ox = O2(137),
          Oz = O2(273),
          OQ = O2(254),
          Op = O2(259),
          OM = function () {
            var Pi = Object(O4.useState)([]),
              PD = Object(O9.a)(Pi, 2),
              Po = PD[0],
              Pa = PD[1]
            return {
              notifications: Po,
              addNotification: function (PC) {
                return Pa(function (PT) {
                  return [].concat(Object(O8.a)(PT), [PC])
                })
              },
              deleteNotification: function (PC) {
                return Pa(function (PX) {
                  return PX.filter(function (Pf) {
                    return Pf.id !== PC
                  })
                })
              },
            }
          },
          OF = O2(124),
          OI = O2(0),
          OK = function (Pd) {
            var PD = parseInt(Pd, 10)
            return [Math.floor(PD / 3600), Math.floor(PD / 60) % 60, PD % 60]
              .map(function (Po) {
                return Po < 10 ? '0' + Po : Po
              })
              .filter(function (Po, Pa) {
                return '00' !== Po || Pa > 0
              })
              .join(':')
          }
        function OG(Pd) {
          var PD = Pd.seconds,
            Po = Pd.text,
            Pa = (function (PS, PT, PX) {
              var Pv = {
                  NWKrh: 'jRAiP',
                  FhLuy: 'ScLPk',
                  hJJLt: function (Pg, Pc) {
                    return Pg - Pc
                  },
                },
                Pf = Object(O4.useState)(PS),
                PL = Object(O9.a)(Pf, 2),
                Py = PL[0],
                PU = PL[1]
              return (
                Object(O4.useEffect)(
                  function () {
                    0 !== Py
                      ? setTimeout(function () {
                          Pv.NWKrh === Pv.FhLuy
                            ? (OV.current = Oi)
                            : PU(Pv.hJJLt(Py, 1))
                        }, 1000)
                      : Ob(PX, {
                          action: 'reject',
                          _data: { confirmationId: PT },
                        })
                  },
                  [Py]
                ),
                Py
              )
            })(PD, Pd.id, Pd.callback),
            PC = OK(Pa)
          return Object(OI.jsxs)('div', {
            children: [PC, ' - ', Po],
          })
        }
        function On(Pd) {
          Object(OF.a)(Pd)
          var PD = (function () {
              var PC = Object(O4.useState)(0),
                PS = Object(O9.a)(PC, 2),
                PT = PS[0],
                PX = PS[1]
              return (
                Object(O4.useEffect)(
                  function () {
                    setTimeout(function () {
                      PX(PT + 1)
                    }, 1000)
                  },
                  [PT]
                ),
                PT
              )
            })(),
            Po = OK(PD)
          return Object(OI.jsx)('div', { children: Po })
        }
        var Od = function (Pd) {
            var PD = Pd.deleteNotification,
              Po = Pd.notification,
              Pa = Po.id,
              PC = Po.isCall,
              PS = Po.calls,
              PT = Po.isConfirmation,
              PX = Po.confirmation,
              Pv = Po.header,
              Pf = Po.content,
              PL = Po.isPerma,
              Py = Po.cancelButton,
              PU = Po.jobGroupId,
              Pg = Po.icon,
              Pc = Po.iconColor,
              PJ = Po.bgColor,
              Pj = Object(O4.useState)(true),
              Pq = Object(O9.a)(Pj, 2),
              Pl = Pq[0],
              PN = Pq[1],
              Pr = Object(O4.useState)(false),
              PY = Object(O9.a)(Pr, 2),
              Ps = PY[0],
              Pu = PY[1],
              Pm = Object(O4.useState)(false),
              PW = Object(O9.a)(Pm, 2),
              PR = PW[0],
              Pw = PW[1],
              PZ = Object(O4.useState)(false),
              PH = Object(O9.a)(PZ, 2),
              V0 = PH[0],
              V1 = PH[1],
              V2 = Object(O4.useState)(''),
              V3 = Object(O9.a)(V2, 2),
              V4 = V3[0],
              V5 = V3[1],
              V6 = Object(O4.useState)(''),
              V7 = Object(O9.a)(V6, 2),
              V8 = V7[0],
              V9 = V7[1],
              VO = Object(O4.useState)(''),
              VA = Object(O9.a)(VO, 2),
              VP = VA[0],
              VV = VA[1]
            Object(O4.useEffect)(function () {
              PR || (Pw(true), V5(Pv), V9(Pf), VV(PU))
            }, [])
            Object(O4.useEffect)(function () {
              if (!PL) {
                var Vh = setTimeout(
                  function () {
                    return PN(false)
                  },
                  PT ? Number(1000 * PX.timeOut) : 3000
                )
                return function () {
                  clearTimeout(Vh)
                }
              }
            }, [])
            Object(O4.useEffect)(
              function () {
                Pl ||
                  (Pu(true),
                  setTimeout(function () {
                    PD(Pa)
                  }, 500))
              },
              [Pl, PD, Pa]
            )
            OA('updateNotify', function (VB) {
              if (Number(VB.id) === Number(VP)) {
                ;(void 0 === VB.title && '' === VB.title) || V5(VB.title)
                ;(void 0 === VB.body && '' === VB.body) || V9(VB.body)
              }
            })
            OA('closeNotify', function (VB) {
              if (Number(VB.id) === Number(VP)) {
                PN(false)
                Pl ||
                  (Pu(true),
                  setTimeout(function () {
                    PD(Pa)
                  }, 500))
              }
            })
            OA('closeNotifyByCallID', function (VB) {
              if (Number(VB.callId) === PS.callId) {
                PN(false)
                Pl || PD(Pa)
              }
            })
            OA('updateNotifyByCallID', function (VB) {
              if (Number(VB.callId) === PS.callId) {
                V1(true)
                V9('Disconnected!')
                setTimeout(function () {
                  Pu(true)
                  setTimeout(function () {
                    V1(false), PD(Pa)
                  }, 500)
                }, 500)
              }
            })
            var Vb = function () {
              Ob('rd-ui:callEnd', { callId: PS.callId }).then(function (VB) {})
            }
            return Object(OI.jsxs)('div', {
              id: Pa,
              className: Ps
                ? 'notification-container notification-container-fade-out'
                : 'notification-container ',
              onClick: function () {
                return (function (VB) {
                  PC ||
                    PT ||
                    PL ||
                    (Pu(true),
                    setTimeout(function () {
                      PD(VB)
                    }, 500))
                })(Pa)
              },
              children: [
                Object(OI.jsxs)('div', {
                  className: 'app-bar',
                  children: [
                    Object(OI.jsx)('div', {
                      className: 'icon',
                      style: {
                        background: PJ,
                        color: Pc,
                      },
                      children: Object(OI.jsx)('i', {
                        className: ''.concat(Pg, ' fa-w-16 fa-fw fa-sm'),
                        style: {
                          WebkitTextStrokeColor: 'black',
                          WebkitTextStrokeWidth: '0.3px',
                        },
                      }),
                    }),
                    Object(OI.jsx)('div', {
                      className: 'name',
                      children: Object(OI.jsx)(OE.a, {
                        style: {
                          color: '#fff',
                          wordBreak: 'break-word',
                        },
                        variant: 'body2',
                        gutterBottom: true,
                        children: V4,
                      }),
                    }),
                    Object(OI.jsx)(OE.a, {
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
                Object(OI.jsxs)('div', {
                  className: 'content',
                  children: [
                    Object(OI.jsx)('div', {
                      className: 'text',
                      style: { display: PT || (PC && PS.progress) ? 'none' : '' },
                      children: Object(OI.jsx)(OE.a, {
                        style: {
                          color: '#fff',
                          wordBreak: 'break-word',
                        },
                        variant: 'body2',
                        gutterBottom: true,
                        children: V8,
                      }),
                    }),
                    Object(OI.jsx)('div', {
                      className: 'text',
                      style: { display: PT ? '' : 'none' },
                      children: Object(OI.jsx)(OE.a, {
                        style: {
                          color: '#fff',
                          wordBreak: 'break-word',
                        },
                        variant: 'body2',
                        gutterBottom: true,
                        children: Object(OI.jsx)(OG, {
                          seconds: Number(PX.timeOut),
                          text: V8,
                          id: PX.id,
                          callback: PX.onAccept,
                        }),
                      }),
                    }),
                    Object(OI.jsx)('div', {
                      className: 'text',
                      style: { display: PC && PS.progress ? '' : 'none' },
                      children: Object(OI.jsx)(OE.a, {
                        style: {
                          color: '#fff',
                          wordBreak: 'break-word',
                        },
                        variant: 'body2',
                        gutterBottom: true,
                        children: V0 ? V8 : Object(OI.jsx)(On, {}),
                      }),
                    }),
                    Object(OI.jsxs)('div', {
                      className: 'actions',
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'action action-reject',
                          style: {
                            display: PC && PS.receive && !V0 ? '' : 'none',
                          },
                          children: Object(OI.jsx)(Op.a, {
                            title: 'Hang Up',
                            placement: 'top',
                            sx: {
                              backgroundColor: 'rgba(97, 97, 97, 0.9)',
                              fontSize: '1em',
                              maxWdith: '1000px',
                            },
                            arrow: true,
                            children: Object(OI.jsx)('i', {
                              onClick: Vb,
                              className: 'fas fa-times-circle fa-w-16 fa-fw',
                            }),
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'action action-accept',
                          style: {
                            display: PC && PS.receive && !V0 ? '' : 'none',
                          },
                          children: Object(OI.jsx)(Op.a, {
                            title: 'Answer',
                            placement: 'top',
                            sx: {
                              backgroundColor: 'rgba(97, 97, 97, 0.9)',
                              fontSize: '1em',
                              maxWdith: '1000px',
                            },
                            arrow: true,
                            children: Object(OI.jsx)('i', {
                              onClick: function () {
                                Ob('rd-ui:callAccept', {
                                  callId: PS.callId,
                                }).then(function (VB) {})
                              },
                              className: 'fas fa-check-circle fa-w-16 fa-fw',
                            }),
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'action action-reject',
                          style: {
                            display: PC && PS.dialing && !V0 ? '' : 'none',
                          },
                          children: Object(OI.jsx)(Op.a, {
                            title: 'Hang Up',
                            placement: 'top',
                            sx: {
                              backgroundColor: 'rgba(97, 97, 97, 0.9)',
                              fontSize: '1em',
                              maxWdith: '1000px',
                            },
                            arrow: true,
                            children: Object(OI.jsx)('i', {
                              onClick: Vb,
                              className: 'fas fa-times-circle fa-w-16 fa-fw',
                            }),
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'action action-reject',
                          style: {
                            display: PC && PS.progress && !V0 ? '' : 'none',
                          },
                          children: Object(OI.jsx)(Op.a, {
                            title: 'Hang Up',
                            placement: 'top',
                            sx: {
                              backgroundColor: 'rgba(97, 97, 97, 0.9)',
                              fontSize: '1em',
                              maxWdith: '1000px',
                            },
                            arrow: true,
                            children: Object(OI.jsx)('i', {
                              onClick: Vb,
                              className: 'fas fa-times-circle fa-w-16 fa-fw',
                            }),
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'action action-reject',
                          style: { display: PT ? '' : 'none' },
                          children: Object(OI.jsx)(Op.a, {
                            title: 'Decline',
                            placement: 'top',
                            sx: {
                              backgroundColor: 'rgba(97, 97, 97, 0.9)',
                              fontSize: '1em',
                              maxWdith: '1000px',
                            },
                            arrow: true,
                            children: Object(OI.jsx)('i', {
                              onClick: function () {
                                Ob(PX.onReject, {
                                  action: 'reject',
                                  _data: { confirmationId: PX.id },
                                })
                                Pu(true)
                                setTimeout(function () {
                                  PD(Pa)
                                }, 500)
                              },
                              className: 'fas fa-times-circle fa-w-16 fa-fw',
                            }),
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'action action-accept',
                          style: { display: PT ? '' : 'none' },
                          children: Object(OI.jsx)(Op.a, {
                            title: 'Accept',
                            placement: 'top',
                            sx: {
                              backgroundColor: 'rgba(97, 97, 97, 0.9)',
                              fontSize: '1em',
                              maxWdith: '1000px',
                            },
                            arrow: true,
                            children: Object(OI.jsx)('i', {
                              onClick: function () {
                                Ob(PX.onAccept, {
                                  action: 'accept',
                                  _data: { confirmationId: PX.id },
                                })
                                Pu(true)
                                setTimeout(function () {
                                  PD(Pa)
                                }, 500)
                              },
                              className: 'fas fa-check-circle fa-w-16 fa-fw',
                            }),
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'action action-reject',
                          style: { display: PL && Py ? '' : 'none' },
                          children: Object(OI.jsx)(Op.a, {
                            title: 'Cancel Activity',
                            placement: 'top',
                            sx: {
                              backgroundColor: 'rgba(97, 97, 97, 0.9)',
                              fontSize: '1em',
                              maxWdith: '1000px',
                            },
                            arrow: true,
                            children: Object(OI.jsx)('i', {
                              onClick: function () {
                                Ob('cancelActivity', { id: VP })
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
          },
          Oi = O2(20),
          OD = O2(262),
          Oo = O2(251),
          Oa = O2(265),
          OC = O2(256),
          OS = O2(17),
          OT = O2(8),
          OX =
            (Object(OT.b)({
              key: 'hasBurnerState',
              default: false,
            }),
            Object(OT.b)({
              key: 'filteredContactsState',
              default: [],
            }),
            Object(OT.b)({
              key: 'activeHoverIdState',
              default: '',
            })),
          Ov = Object(OT.b)({
            key: 'purchaseModalState',
            default: false,
          }),
          Of = Object(OT.b)({
            key: 'exchangeModalState',
            default: false,
          }),
          OL = Object(OT.b)({
            key: 'cryptoIdState',
            default: 1,
          }),
          Oy = Object(OT.b)({
            key: 'sellModalState',
            default: false,
          }),
          OU = Object(OT.b)({
            key: 'sellStateIdState',
            default: 0,
          }),
          Og = Object(OT.b)({
            key: 'sellPriceState',
            default: 0,
          }),
          Oc = Object(OT.b)({
            key: 'sellPlateState',
            default: '',
          }),
          OJ = Object(OT.b)({
            key: 'hasVPNState',
            default: false,
          }),
          Oj = Object(OT.b)({
            key: 'callsDataState',
            default: [],
          }),
          Oq = Object(OT.b)({
            key: 'filteredCallsDataState',
            default: [],
          }),
          Ol = Object(OT.b)({
            key: 'editModeState',
            default: false,
          }),
          ON = Object(OT.b)({
            key: 'editDataState',
            default: {},
          }),
          Or = Object(OT.b)({
            key: 'phoneBrandState',
            default: 'android',
          }),
          OY = Object(OT.b)({
            key: 'phoneBackgroundState',
            default: 'https://i.imgur.com/3KTfLIV.jpg',
          }),
          Os = Object(OT.b)({
            key: 'phoneReceiveSMSState',
            default: true,
          }),
          Ou = Object(OT.b)({
            key: 'phoneNewTweetState',
            default: true,
          }),
          Om = Object(OT.b)({
            key: 'phoneReceiveEmailState',
            default: true,
          }),
          OW = Object(OT.b)({
            key: 'phoneEmbeddedImagesState',
            default: true,
          }),
          OR = O2(38),
          Ow = O2.n(OR),
          OZ = O2(238),
          OH = O2(260),
          A0 = O2(250),
          A1 = O2(239),
          A2 = O2(261),
          A3 = O2(245),
          A4 = Object(A3.a)({
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
          A5 = function () {
            var Pi = A4(),
              PD = Object(O4.useState)({
                cid: 0,
                bankid: 0,
                phonenumber: 0,
                cash: 0,
                bank: 0,
                casino: 0,
                licenses: [],
              }),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1]
            return (
              Object(O4.useEffect)(function () {
                Ob('getInfoData', {}).then(function (PX) {
                  PC(PX)
                })
              }, []),
              Object(OI.jsx)(OI.Fragment, {
                children: Object(OI.jsxs)('div', {
                  className: 'information-container',
                  style: { zIndex: 500 },
                  children: [
                    Object(OI.jsxs)('div', {
                      className: Pi.informationInnerContainer,
                      children: [
                        Object(OI.jsx)(Op.a, {
                          title: 'State ID',
                          placement: 'top',
                          sx: {
                            backgroundColor: 'rgba(97, 97, 97, 0.9)',
                            fontSize: '1em',
                            maxWdith: '1000px',
                          },
                          arrow: true,
                          children: Object(OI.jsxs)(OZ.a, {
                            sx: { marginBottom: '5%' },
                            direction: 'row',
                            alignItems: 'center',
                            gap: 1,
                            children: [
                              Object(OI.jsx)('i', {
                                className: 'fas fa-id-card fa-w-16 fa-fw',
                                style: {
                                  color: '#fff',
                                  fontSize: '25px',
                                },
                              }),
                              Object(OI.jsx)(OE.a, {
                                variant: 'subtitle1',
                                sx: {
                                  fontSize: '1.2rem',
                                  fontWeight: '500',
                                },
                                style: { color: '#fff' },
                                children: Pa.cid,
                              }),
                            ],
                          }),
                        }),
                        Object(OI.jsx)(Op.a, {
                          title: 'Bank ID',
                          placement: 'top',
                          sx: {
                            backgroundColor: 'rgba(97, 97, 97, 0.9)',
                            fontSize: '1em',
                            maxWdith: '1000px',
                          },
                          arrow: true,
                          children: Object(OI.jsxs)(OZ.a, {
                            sx: { marginBottom: '5%' },
                            direction: 'row',
                            alignItems: 'center',
                            gap: 1,
                            children: [
                              Object(OI.jsx)('i', {
                                className: 'fas fa-university fa-w-16 fa-fw',
                                style: {
                                  color: '#fff',
                                  fontSize: '25px',
                                },
                              }),
                              Object(OI.jsx)(OE.a, {
                                variant: 'subtitle1',
                                sx: {
                                  fontSize: '1.2rem',
                                  fontWeight: '500',
                                },
                                style: { color: '#fff' },
                                children: Pa.bankid,
                              }),
                            ],
                          }),
                        }),
                        Object(OI.jsx)(Op.a, {
                          title: 'Phone Number',
                          placement: 'top',
                          sx: {
                            backgroundColor: 'rgba(97, 97, 97, 0.9)',
                            fontSize: '1em',
                            maxWdith: '1000px',
                          },
                          arrow: true,
                          children: Object(OI.jsxs)(OZ.a, {
                            sx: { marginBottom: '5%' },
                            direction: 'row',
                            alignItems: 'center',
                            gap: 1,
                            children: [
                              Object(OI.jsx)('i', {
                                className: 'fas fa-mobile fa-w-16 fa-fw',
                                style: {
                                  color: '#fff',
                                  fontSize: '25px',
                                },
                              }),
                              Object(OI.jsx)(OE.a, {
                                variant: 'subtitle1',
                                sx: {
                                  fontSize: '1.2rem',
                                  fontWeight: '500',
                                },
                                style: { color: '#fff' },
                                children: (function (PT) {
                                  var PX = ('' + PT)
                                    .replace(/\D/g, '')
                                    .match(/^(\d{3})(\d{3})(\d{4})$/)
                                  return PX
                                    ? '(' + PX[1] + ') ' + PX[2] + '-' + PX[3]
                                    : PT
                                })(Pa.phonenumber),
                              }),
                            ],
                          }),
                        }),
                        Object(OI.jsx)(Op.a, {
                          title: 'Cash on you',
                          placement: 'top',
                          sx: {
                            backgroundColor: 'rgba(97, 97, 97, 0.9)',
                            fontSize: '1em',
                            maxWdith: '1000px',
                          },
                          arrow: true,
                          children: Object(OI.jsxs)(OZ.a, {
                            sx: { marginBottom: '5%' },
                            direction: 'row',
                            alignItems: 'center',
                            gap: 1,
                            children: [
                              Object(OI.jsx)('i', {
                                className: 'fas fa-wallet fa-w-16 fa-fw',
                                style: {
                                  color: '#aed581',
                                  fontSize: '25px',
                                },
                              }),
                              Object(OI.jsx)(OE.a, {
                                variant: 'subtitle1',
                                sx: {
                                  fontSize: '1.2rem',
                                  fontWeight: '500',
                                },
                                style: { color: '#fff' },
                                children: Pa.cash.toLocaleString('en-Us', {
                                  style: 'currency',
                                  currency: 'USD',
                                }),
                              }),
                            ],
                          }),
                        }),
                        Object(OI.jsx)(Op.a, {
                          title: 'Money in your bank',
                          placement: 'top',
                          sx: {
                            backgroundColor: 'rgba(97, 97, 97, 0.9)',
                            fontSize: '1em',
                            maxWdith: '1000px',
                          },
                          arrow: true,
                          children: Object(OI.jsxs)(OZ.a, {
                            sx: { marginBottom: '5%' },
                            direction: 'row',
                            alignItems: 'center',
                            gap: 1,
                            children: [
                              Object(OI.jsx)('i', {
                                className: 'fas fa-piggy-bank fa-w-16 fa-fw',
                                style: {
                                  color: '#4dd0e1',
                                  fontSize: '25px',
                                },
                              }),
                              Object(OI.jsx)(OE.a, {
                                variant: 'subtitle1',
                                sx: {
                                  fontSize: '1.2rem',
                                  fontWeight: '500',
                                },
                                style: { color: '#fff' },
                                children: Pa.bank.toLocaleString('en-Us', {
                                  style: 'currency',
                                  currency: 'USD',
                                }),
                              }),
                            ],
                          }),
                        }),
                        Object(OI.jsx)(Op.a, {
                          title: 'Casino Balance',
                          placement: 'top',
                          sx: {
                            backgroundColor: 'rgba(97, 97, 97, 0.9)',
                            fontSize: '1em',
                            maxWdith: '1000px',
                          },
                          arrow: true,
                          children: Object(OI.jsxs)(OZ.a, {
                            sx: { marginBottom: '5%' },
                            direction: 'row',
                            alignItems: 'center',
                            gap: 1,
                            children: [
                              Object(OI.jsx)('i', {
                                className: 'fas fa-dice-three fa-w-16 fa-fw',
                                style: {
                                  color: '#ff4081',
                                  fontSize: '25px',
                                },
                              }),
                              Object(OI.jsx)(OE.a, {
                                variant: 'subtitle1',
                                sx: {
                                  fontSize: '1.2rem',
                                  fontWeight: '500',
                                },
                                style: { color: '#fff' },
                                children: Pa.casino,
                              }),
                            ],
                          }),
                        }),
                      ],
                    }),
                    Object(OI.jsx)('div', {
                      className: Pi.informationSecondInnerContainer,
                      children: Object(OI.jsx)(OE.a, {
                        variant: 'subtitle1',
                        sx: { fontSize: '1.4rem' },
                        style: { color: '#fff' },
                        children: 'Licenses',
                      }),
                    }),
                    Object(OI.jsx)('div', {
                      className: Pi.informationThirdInnerContainer,
                      children: Object(OI.jsx)(OH.a, {
                        disablePadding: true,
                        children:
                          Pa.licenses && Pa.licenses.length > 0
                            ? Pa.licenses.map(function (PT) {
                                return Object(OI.jsx)(A0.a, {
                                  sx: {
                                    paddingTop: '0px',
                                    paddingBottom: '0px',
                                  },
                                  secondaryAction: Object(OI.jsx)(A2.a, {
                                    edge: 'end',
                                    disabled: true,
                                    disableFocusRipple: true,
                                    disableRipple: true,
                                    disableTouchRipple: true,
                                    children: Object(OI.jsx)('i', {
                                      className: PT.status
                                        ? 'fas fa-check-circle fa-w-16 fa-fw'
                                        : 'fas fa-times-circle fa-w-16 fa-fw',
                                      style: {
                                        color: PT.status ? '#abd17f' : '#d17f7f',
                                        fontSize: '15px',
                                      },
                                    }),
                                  }),
                                  children: Object(OI.jsx)(A1.a, {
                                    primary: Object(OI.jsxs)(OE.a, {
                                      variant: 'subtitle1',
                                      sx: { fontSize: '1rem' },
                                      style: { color: '#fff' },
                                      children: [PT.type, ' License'],
                                    }),
                                  }),
                                })
                              })
                            : Object(OI.jsx)(OI.Fragment, {}),
                      }),
                    }),
                  ],
                }),
              })
            )
          },
          A6 = O2(130),
          A7 = O2(97),
          A8 = O2.n(A7),
          A9 = O2(80),
          AO = O2.n(A9),
          AA = Object(A3.a)({
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
          AP = Object(A3.a)({
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
          AV = O2(37),
          Ab = O2.n(AV),
          AB = function (Pd) {
            var PD = AP()
            return Object(OI.jsx)(OI.Fragment, {
              children: Object(OI.jsx)('div', {
                className: PD.appOuterContainer,
                style: { zIndex: 500 },
                children: Object(OI.jsx)('div', {
                  className: PD.appInnerContainer,
                  children: Object(OI.jsxs)('div', {
                    className: 'app-container',
                    children: [
                      Object(OI.jsxs)('div', {
                        className: PD.appSearch,
                        style: { display: 0 == Pd.search.length ? 'none' : '' },
                        children: [
                          Pd.primaryActions && Pd.primaryActions.length > 0
                            ? Pd.primaryActions.map(function (Po) {
                                return Object(OI.jsx)(OI.Fragment, {
                                  children:
                                    Po.type && 'goback' === Po.type
                                      ? Object(OI.jsx)(Op.a, {
                                          title: Po.title,
                                          placement: Po.placement,
                                          sx: {
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('div', {
                                            style: {
                                              color: '#fff',
                                              width: '40px',
                                              display: 'flex',
                                              alignItems: 'center',
                                            },
                                            children: Object(OI.jsx)('i', {
                                              onClick: Po.action,
                                              className: 'fas '.concat(
                                                Po.icon,
                                                ' fa-fw fa-lg'
                                              ),
                                            }),
                                          }),
                                        })
                                      : Object(OI.jsx)(OI.Fragment, {}),
                                })
                              })
                            : Object(OI.jsx)(OI.Fragment, {}),
                          Object(OI.jsx)('div', {
                            className: PD.appSearchWrapper,
                            children: Object(OI.jsx)('div', {
                              className: 'input-wrapper',
                              children: Object(OI.jsx)(OD.a, {
                                fullWidth: true,
                                sx: { width: '100%' },
                                children: Object(OI.jsx)(Oo.a, {
                                  id: 'input-with-icon-textfield',
                                  label: 'Search',
                                  onChange: function (Po) {
                                    return (function (PC) {
                                      if ('' !== PC) {
                                        var PT = Pd.search.filter,
                                          PX = Pd.search.list,
                                          Pv = PC.toString().toLowerCase(),
                                          Pf = PX.filter(function (PL) {
                                            return Object.keys(PL).some(function (
                                              PU
                                            ) {
                                              return PT.includes(PU)
                                            })
                                          }).filter(function (PL) {
                                            return Object.values(PL)
                                              .map(function (Py) {
                                                return null === Py ||
                                                  void 0 === Py
                                                  ? void 0
                                                  : Py.toString().toLocaleLowerCase()
                                              })
                                              .some(function (Py) {
                                                return null === Py ||
                                                  void 0 === Py
                                                  ? void 0
                                                  : Py.startsWith(Pv)
                                              })
                                          })
                                        Pd.search.onChange(Pf)
                                      } else {
                                        Pd.search.onChange(Pd.search.list)
                                      }
                                    })(Po.target.value)
                                  },
                                  InputProps: {
                                    startAdornment: Object(OI.jsx)(Oa.a, {
                                      position: 'start',
                                      children: Object(OI.jsx)(Ab.a, {}),
                                    }),
                                  },
                                  variant: 'standard',
                                }),
                              }),
                            }),
                          }),
                        ],
                      }),
                      Pd.primaryActions && Pd.primaryActions.length > 0
                        ? Pd.primaryActions.map(function (Po) {
                            return Object(OI.jsx)(OI.Fragment, {
                              children:
                                Po.type && 'icon' === Po.type
                                  ? Object(OI.jsx)('div', {
                                      className: PD.appIcon,
                                      children: Object(OI.jsx)('div', {
                                        className: PD.appIconWrapper,
                                        children: Object(OI.jsx)(Op.a, {
                                          title: Po.title,
                                          placement: Po.placement,
                                          sx: {
                                            display: Po.show ? '' : 'none',
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('i', {
                                            onClick: Po.action,
                                            style: {
                                              display: Po.show ? '' : 'none',
                                              fontSize: '1.2em',
                                            },
                                            className: ''.concat(
                                              Po.icon,
                                              ' fa-fw fa-lg'
                                            ),
                                          }),
                                        }),
                                      }),
                                    })
                                  : Object(OI.jsx)(OI.Fragment, {}),
                            })
                          })
                        : Object(OI.jsx)(OI.Fragment, {}),
                      Object(OI.jsxs)('div', {
                        className: PD.appList,
                        children: [
                          Pd.children,
                          Object(OI.jsxs)('div', {
                            className: 'flex-centered',
                            style: {
                              display: Pd.emptyMessage ? 'flex' : 'none',
                              padding: '32px',
                              flexDirection: 'column',
                              textAlign: 'center',
                            },
                            children: [
                              Object(OI.jsx)('i', {
                                className: 'fas fa-frown fa-w-16 fa-fw fa-3x',
                                style: {
                                  color: '#fff',
                                  marginBottom: '32px',
                                },
                              }),
                              Object(OI.jsx)(OE.a, {
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
          Ah = function () {
            var Pi = AA(),
              PD = Object(OT.c)(OX),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(O4.useState)([]),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1],
              Pf = Object(O4.useState)([]),
              PL = Object(O9.a)(Pf, 2),
              Py = PL[0],
              PU = PL[1],
              Pg = Object(OT.c)(Oj),
              Pc = Object(O9.a)(Pg, 2),
              PJ = Pc[0],
              Pj = Pc[1],
              Pq = Object(OT.c)(Oq),
              Pl = Object(O9.a)(Pq, 2),
              PN = (Pl[0], Pl[1]),
              Pr = Object(O4.useState)(false),
              PY = Object(O9.a)(Pr, 2),
              Ps = PY[0],
              Pu = PY[1],
              Pm = Object(O4.useState)(false),
              PW = Object(O9.a)(Pm, 2),
              PR = PW[0],
              Pw = PW[1],
              PZ = Object(O4.useState)(false),
              PH = Object(O9.a)(PZ, 2),
              V0 = PH[0],
              V1 = PH[1],
              V2 = Object(O4.useState)(false),
              V3 = Object(O9.a)(V2, 2),
              V4 = V3[0],
              V5 = V3[1],
              V6 = Object(O4.useState)(false),
              V7 = Object(O9.a)(V6, 2),
              V8 = V7[0],
              V9 = V7[1],
              VO = Object(O4.useState)(''),
              VA = Object(O9.a)(VO, 2),
              VP = VA[0],
              VV = VA[1],
              Vb = Object(O4.useState)(''),
              VB = Object(O9.a)(Vb, 2),
              Vh = VB[0],
              Vk = VB[1],
              VE = Object(O4.useState)(''),
              Vx = Object(O9.a)(VE, 2),
              Vz = Vx[0],
              VQ = Vx[1],
              Vp = Object(O4.useState)(''),
              VM = Object(O9.a)(Vp, 2),
              VF = VM[0],
              VI = VM[1]
            Object(O4.useEffect)(function () {
              Ob('getContactsData', {}).then(function (Va) {
                Pv(Va)
                PU(Va)
              })
            }, [])
            var VK = function (Vo) {
                var VC = ('' + Vo)
                  .replace(/\D/g, '')
                  .match(/^(\d{3})(\d{3})(\d{4})$/)
                return VC ? '(' + VC[1] + ') ' + VC[2] + '-' + VC[3] : Vo
              },
              VG = function (Vo) {
                for (
                  var Va = '', VC = '0123456789', VS = VC.length, VT = 0;
                  VT < Vo;
                  VT++
                ) {
                  Va += VC.charAt(Math.floor(Math.random() * VS))
                }
                return Va
              },
              Vn = function (Vo) {
                PC(Vo.currentTarget.id)
              },
              Vd = function () {
                PC('')
              },
              Vi = function (Vo) {
                Pw(true)
                ;(function (Va) {
                  VQ(Va)
                })(Vo.currentTarget.id)
              },
              VD = function (Vo) {
                var VC = Vo.currentTarget.id
                Ob('removePhoneContact', { id: Vo.currentTarget.id }).then(
                  function (VS) {
                    if (VS.meta.ok) {
                      var VT = Py.filter(function (Vv) {
                        return Vv.number.toString() !== VC
                      })
                      PU(VT)
                    }
                  }
                )
              }
            return (
              OA('closeApps', function () {
                Pu(false),
                  Pw(false),
                  V1(false),
                  V5(false),
                  V9(false),
                  Pu(false),
                  Pw(false),
                  VV(''),
                  Vk(''),
                  VQ(''),
                  VI('')
              }),
              Object(OI.jsxs)(OI.Fragment, {
                children: [
                  Object(OI.jsx)('div', {
                    className: Pi.contactModalContainer,
                    style: { display: Ps ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.contactModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: V0 ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: V4 ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: V8 ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)(OD.a, {
                                fullWidth: true,
                                sx: { width: '100%' },
                                children: Object(OI.jsx)(Oo.a, {
                                  id: 'input-with-icon-textfield',
                                  label: 'Name',
                                  variant: 'standard',
                                  onChange: function (Vo) {
                                    Vk(Vo.target.value)
                                  },
                                  value: Vh,
                                  InputProps: {
                                    startAdornment: Object(OI.jsx)(Oa.a, {
                                      position: 'start',
                                      children: Object(OI.jsx)(A8.a, {}),
                                    }),
                                  },
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Number',
                                    variant: 'standard',
                                    onChange: function (Vo) {
                                      VV(Vo.target.value)
                                    },
                                    value: VP,
                                    inputProps: { maxLength: 10 },
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)(AO.a, {}),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              className: 'validation-messages',
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Pu(false)
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      V1(true)
                                      V9(true)
                                      Ob('addPhoneContact', {
                                        number: VP,
                                        name: Vh,
                                      }).then(function (Va) {
                                        if (Va.meta.ok) {
                                          var VC = {
                                              id: VG(10),
                                              name: Vh,
                                              number: VP,
                                            },
                                            VS = [].concat(
                                              Object(O8.a)(Py || []),
                                              [VC]
                                            )
                                          VV('')
                                          Vk('')
                                          PU(VS)
                                        }
                                      })
                                      VV('')
                                      Vk('')
                                      setTimeout(function () {
                                        V1(false),
                                          V5(true),
                                          setTimeout(function () {
                                            V5(false)
                                            Pu(false)
                                            V9(false)
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
                  Object(OI.jsx)('div', {
                    className: Pi.contactMessageModalContainer,
                    style: { display: PR ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.contactMessageModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: V0 ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: V4 ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: V8 ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Number',
                                    variant: 'standard',
                                    onChange: function (Vo) {
                                      VQ(Vo.target.value)
                                    },
                                    value: Vz,
                                    inputProps: { maxLength: 10 },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)(OD.a, {
                                fullWidth: true,
                                sx: { width: '100%' },
                                children: Object(OI.jsx)(Oo.a, {
                                  multiline: true,
                                  maxRows: 10,
                                  id: 'input-with-icon-textfield',
                                  label: 'Message',
                                  variant: 'standard',
                                  onChange: function (Vo) {
                                    VI(Vo.target.value)
                                  },
                                  defaultValue: VF,
                                  value: VF,
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Pw(false)
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      V1(true)
                                      V9(true)
                                      Ob('sendMessage', {
                                        number: Vz,
                                        message: VF,
                                      }).then(function (Va) {
                                        VQ('')
                                        VI('')
                                        V1(false)
                                        V5(true)
                                        setTimeout(function () {
                                          V5(false), Pw(false), V9(false)
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
                  Object(OI.jsx)(AB, {
                    emptyMessage: 0 === Py.length,
                    primaryActions: [
                      {
                        type: 'icon',
                        title: 'Add Contact',
                        placement: 'left',
                        icon: 'fas fa-user-plus fa-w-16',
                        action: function (Vo) {
                          Pu(true)
                          VQ(Vo.currentTarget.id)
                        },
                        show: true,
                      },
                    ],
                    search: {
                      filter: ['name', 'number'],
                      list: PX,
                      onChange: PU,
                    },
                    children:
                      Py && Py.length > 0
                        ? Py.map(function (Vo) {
                            var VC
                            return Object(OI.jsx)(
                              'div',
                              {
                                id: Vo.number,
                                className: 'component-paper cursor-pointer',
                                onMouseEnter: Vn,
                                onMouseLeave: Vd,
                                children: Object(OI.jsxs)('div', {
                                  className: 'main-container',
                                  children: [
                                    Object(OI.jsx)('div', {
                                      className: 'image',
                                      children: Object(OI.jsx)('i', {
                                        className:
                                          'fas fa-user-circle fa-w-16 fa-fw fa-3x',
                                      }),
                                    }),
                                    Object(OI.jsxs)('div', {
                                      className: 'details',
                                      children: [
                                        Object(OI.jsx)('div', {
                                          className: 'title',
                                          children: Object(OI.jsx)(OE.a, {
                                            style: {
                                              color: '#fff',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                            children: Vo.name,
                                          }),
                                        }),
                                        Object(OI.jsx)('div', {
                                          className: 'description',
                                          children: Object(OI.jsx)('div', {
                                            className: 'flex-row',
                                            children: Object(OI.jsx)(OE.a, {
                                              style: {
                                                color: '#fff',
                                                wordBreak: 'break-word',
                                              },
                                              variant: 'body2',
                                              gutterBottom: true,
                                              children: VK(Vo.number),
                                            }),
                                          }),
                                        }),
                                      ],
                                    }),
                                    Object(OI.jsxs)('div', {
                                      className:
                                        (null === Pa || void 0 === Pa
                                          ? void 0
                                          : Pa.toString()) ===
                                        (null === Vo ||
                                        void 0 === Vo ||
                                        null === (VC = Vo.number) ||
                                        void 0 === VC
                                          ? void 0
                                          : VC.toString())
                                          ? 'actions actions-show'
                                          : 'actions',
                                      children: [
                                        Object(OI.jsx)(Op.a, {
                                          title: 'Remove Contact',
                                          placement: 'top',
                                          sx: {
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('div', {
                                            children: Object(OI.jsx)('i', {
                                              onClick: VD,
                                              id: Vo.number,
                                              className:
                                                'fas fa-user-slash fa-w-16 fa-fw fa-lg',
                                            }),
                                          }),
                                        }),
                                        Object(OI.jsx)(Op.a, {
                                          title: 'Call',
                                          placement: 'top',
                                          sx: {
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('div', {
                                            children: Object(OI.jsx)('i', {
                                              onClick: function () {
                                                return (function (VT, VX) {
                                                  Ob('rd-ui:callStart', {
                                                    number: VX,
                                                  })
                                                  var Vv = VG(4),
                                                    Vf = VK(VT),
                                                    VL = Ow()().unix(),
                                                    VU = {
                                                      id: Vv,
                                                      number: VX,
                                                      name: Vf,
                                                      date: VL,
                                                      state: 'out',
                                                    },
                                                    Vg = [].concat(
                                                      Object(O8.a)(Vy || []),
                                                      [VU]
                                                    )
                                                  Pj(Vg)
                                                  PN(Vg)
                                                })(Vo.name, Vo.number)
                                              },
                                              className:
                                                'fas fa-phone fa-w-16 fa-fw fa-lg',
                                            }),
                                          }),
                                        }),
                                        Object(OI.jsx)(Op.a, {
                                          title: 'Message',
                                          placement: 'top',
                                          sx: {
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('div', {
                                            children: Object(OI.jsx)('i', {
                                              onClick: Vi,
                                              id: Vo.number,
                                              className:
                                                'fas fa-comment fa-w-16 fa-fw fa-lg',
                                            }),
                                          }),
                                        }),
                                        Object(OI.jsx)(A6.CopyToClipboard, {
                                          text: Vo.number,
                                          children: Object(OI.jsx)(Op.a, {
                                            title: 'Copy Number',
                                            placement: 'top',
                                            sx: {
                                              backgroundColor:
                                                'rgba(97, 97, 97, 0.9)',
                                            },
                                            arrow: true,
                                            children: Object(OI.jsx)('div', {
                                              children: Object(OI.jsx)('i', {
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
                              Vo.number
                            )
                          })
                        : Object(OI.jsx)(OI.Fragment, {}),
                  }),
                ],
              })
            )
          },
          Ak = Object(A3.a)({
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
          AE = function () {
            var Pi = Ak(),
              PD = Object(OT.c)(OX),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(OT.c)(Oj),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1],
              Pf = Object(OT.c)(Oq),
              PL = Object(O9.a)(Pf, 2),
              Py = PL[0],
              PU = PL[1],
              Pg = Object(O4.useState)(false),
              Pc = Object(O9.a)(Pg, 2),
              PJ = Pc[0],
              Pj = Pc[1],
              Pq = Object(O4.useState)(false),
              Pl = Object(O9.a)(Pq, 2),
              PN = Pl[0],
              Pr = Pl[1],
              PY = Object(O4.useState)(false),
              Ps = Object(O9.a)(PY, 2),
              Pu = Ps[0],
              Pm = Ps[1],
              PW = Object(O4.useState)(false),
              PR = Object(O9.a)(PW, 2),
              Pw = PR[0],
              PZ = PR[1],
              PH = Object(O4.useState)(false),
              V0 = Object(O9.a)(PH, 2),
              V1 = V0[0],
              V2 = V0[1],
              V3 = Object(O4.useState)(''),
              V4 = Object(O9.a)(V3, 2),
              V5 = V4[0],
              V6 = V4[1],
              V7 = Object(O4.useState)(false),
              V8 = Object(O9.a)(V7, 2),
              V9 = V8[0],
              VO = V8[1],
              VA = Object(O4.useState)(''),
              VP = Object(O9.a)(VA, 2),
              VV = VP[0],
              Vb = VP[1],
              VB = Object(O4.useState)(''),
              Vh = Object(O9.a)(VB, 2),
              Vk = Vh[0],
              VE = Vh[1],
              Vx = Object(O4.useState)(''),
              Vz = Object(O9.a)(Vx, 2),
              VQ = Vz[0],
              Vp = Vz[1],
              VM = Object(O4.useState)(''),
              VF = Object(O9.a)(VM, 2),
              VI = VF[0],
              VK = VF[1],
              VG = function (Va) {
                PC(Va.currentTarget.id)
              },
              Vn = function () {
                PC('')
              },
              Vd = function (Va) {
                VO(true)
                ;(function (VS) {
                  Vb(VS)
                })(Va.currentTarget.id)
              },
              Vi = function (Va) {
                V2(true)
                VK(Va.currentTarget.id)
              },
              VD = function (Va) {
                var VC = ('' + Va)
                  .replace(/\D/g, '')
                  .match(/^(\d{3})(\d{3})(\d{4})$/)
                return VC ? '(' + VC[1] + ') ' + VC[2] + '-' + VC[3] : Va
              },
              Vo = function (Va) {
                for (
                  var VC = '', VT = '0123456789'.length, VX = 0;
                  VX < Va;
                  VX++
                ) {
                  VC += '0123456789'.charAt(Math.floor(Math.random() * VT))
                }
                return VC
              }
            return (
              OA('closeApps', function () {
                PZ(false)
                VO(false)
                V2(false)
                Pj(false)
                Pr(false)
                Pm(false)
                V6('')
                Vb('')
                VE('')
                Vp('')
                VK('')
              }),
              Object(OI.jsxs)(OI.Fragment, {
                children: [
                  Object(OI.jsx)('div', {
                    className: Pi.callsCallModalContainer,
                    style: { display: Pw ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.callsCallModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: PJ ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: PN ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: Pu ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Number',
                                    variant: 'standard',
                                    onChange: function (Va) {
                                      V6(Va.target.value)
                                    },
                                    value: V5,
                                    inputProps: { maxLength: 10 },
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)(AO.a, {}),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      PZ(false)
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Ob('rd-ui:callStart', { number: V5 }).then(
                                        function (VC) {
                                          PZ(false)
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
                  Object(OI.jsx)('div', {
                    className: Pi.callsMessageModalContainer,
                    style: { display: V9 ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.callsMessageModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: PJ ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: PN ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: Pu ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Number',
                                    variant: 'standard',
                                    onChange: function (Va) {
                                      Vb(Va.target.value)
                                    },
                                    value: VV,
                                    inputProps: { maxLength: 10 },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)(OD.a, {
                                fullWidth: true,
                                sx: { width: '100%' },
                                children: Object(OI.jsx)(Oo.a, {
                                  multiline: true,
                                  maxRows: 10,
                                  id: 'input-with-icon-textfield',
                                  label: 'Message',
                                  variant: 'standard',
                                  onChange: function (Va) {
                                    VE(Va.target.value)
                                  },
                                  defaultValue: Vk,
                                  value: Vk,
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      VO(false)
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Pj(true),
                                        Pm(true),
                                        Ob('sendMessage', {
                                          number: VV,
                                          message: Vk,
                                        }).then(function (VS) {
                                          Vb('')
                                          VE('')
                                          Pj(false)
                                          Pr(true)
                                          setTimeout(function () {
                                            Pr(false)
                                            VO(false)
                                            Pm(false)
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
                  Object(OI.jsx)('div', {
                    className: Pi.callsAddContactModalContainer,
                    style: { display: V1 ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.callsAddContactModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: PJ ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: PN ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: Pu ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)(OD.a, {
                                fullWidth: true,
                                sx: { width: '100%' },
                                children: Object(OI.jsx)(Oo.a, {
                                  id: 'input-with-icon-textfield',
                                  label: 'Name',
                                  variant: 'standard',
                                  onChange: function (Va) {
                                    Vp(Va.target.value)
                                  },
                                  value: VQ,
                                  InputProps: {
                                    startAdornment: Object(OI.jsx)(Oa.a, {
                                      position: 'start',
                                      children: Object(OI.jsx)(A8.a, {}),
                                    }),
                                  },
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Number',
                                    variant: 'standard',
                                    onChange: function (Va) {
                                      VK(Va.target.value)
                                    },
                                    value: VI,
                                    inputProps: { maxLength: 10 },
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)(AO.a, {}),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              className: 'validation-messages',
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      V2(false)
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Pj(true)
                                      Pm(true)
                                      Ob('addPhoneContact', {
                                        number: VI,
                                        name: VQ,
                                      }).then(function (VC) {
                                        VK(''),
                                          Vp(''),
                                          Pj(false),
                                          Pr(true),
                                          setTimeout(function () {
                                            Pr(false), V2(false), Pm(false)
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
                  Object(OI.jsx)(AB, {
                    emptyMessage: 0 === Py.length,
                    primaryActions: [
                      {
                        type: 'icon',
                        title: 'Call Number',
                        placement: 'left',
                        icon: 'fas fa-phone fa-w-16',
                        action: function (Va) {
                          PZ(true)
                        },
                        show: true,
                      },
                    ],
                    search: {
                      filter: ['name', 'number'],
                      list: PX,
                      onChange: PU,
                    },
                    children:
                      Py && Py.length > 0
                        ? Py.slice(0)
                            .reverse()
                            .map(function (Va) {
                              return Object(OI.jsx)(
                                'div',
                                {
                                  id: Va.id,
                                  className: 'component-paper cursor-pointer',
                                  onMouseEnter: VG,
                                  onMouseLeave: Vn,
                                  children: Object(OI.jsxs)('div', {
                                    className: 'main-container',
                                    children: [
                                      Object(OI.jsx)('div', {
                                        className: 'image',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas '.concat(
                                            'in' === Va.state
                                              ? 'fa-phone'
                                              : 'fa-phone-alt',
                                            ' fa-w-16 fa-fw fa-3x'
                                          ),
                                        }),
                                      }),
                                      Object(OI.jsxs)('div', {
                                        className: 'details',
                                        children: [
                                          Object(OI.jsx)('div', {
                                            className: 'title',
                                            children: Object(OI.jsx)(OE.a, {
                                              style: {
                                                color: '#fff',
                                                wordBreak: 'break-word',
                                              },
                                              variant: 'body2',
                                              gutterBottom: true,
                                              children: VD(Va.name),
                                            }),
                                          }),
                                          Object(OI.jsx)('div', {
                                            className: 'description',
                                            children: Object(OI.jsx)('div', {
                                              className: 'flex-row',
                                              children: Object(OI.jsx)(OE.a, {
                                                style: {
                                                  color: '#fff',
                                                  wordBreak: 'break-word',
                                                },
                                                variant: 'body2',
                                                gutterBottom: true,
                                                children: Ow()(
                                                  1000 * Number(Va.date)
                                                ).fromNow(),
                                              }),
                                            }),
                                          }),
                                        ],
                                      }),
                                      Object(OI.jsxs)('div', {
                                        className:
                                          Pa.toString() === Va.id.toString()
                                            ? 'actions actions-show'
                                            : 'actions',
                                        children: [
                                          Object(OI.jsx)(Op.a, {
                                            title: 'Call',
                                            placement: 'top',
                                            sx: {
                                              backgroundColor:
                                                'rgba(97, 97, 97, 0.9)',
                                            },
                                            arrow: true,
                                            children: Object(OI.jsx)('div', {
                                              children: Object(OI.jsx)('i', {
                                                onClick: function () {
                                                  return (
                                                    (VS = Va.name),
                                                    void Ob('rd-ui:callStart', {
                                                      number: (VT = Va.number),
                                                    }).then(function (VX) {
                                                      var Vv = Vo(4),
                                                        Vf = VD(VS),
                                                        VL = Ow()().unix(),
                                                        VU = {
                                                          id: Vv,
                                                          number: VT,
                                                          name: Vf,
                                                          date: VL,
                                                          state: 'out',
                                                        },
                                                        Vg = [].concat(
                                                          Object(O8.a)(Vy || []),
                                                          [VU]
                                                        )
                                                      Pv(Vg)
                                                      PU(Vg)
                                                    })
                                                  )
                                                  var VS, VT
                                                },
                                                className:
                                                  'fas fa-phone fa-w-16 fa-fw fa-lg',
                                              }),
                                            }),
                                          }),
                                          Object(OI.jsx)(Op.a, {
                                            title: 'Message',
                                            placement: 'top',
                                            sx: {
                                              backgroundColor:
                                                'rgba(97, 97, 97, 0.9)',
                                            },
                                            arrow: true,
                                            children: Object(OI.jsx)('div', {
                                              children: Object(OI.jsx)('i', {
                                                onClick: Vd,
                                                id: Va.number,
                                                className:
                                                  'fas fa-comment fa-w-16 fa-fw fa-lg',
                                              }),
                                            }),
                                          }),
                                          Object(OI.jsx)(Op.a, {
                                            title: 'Add Contact',
                                            placement: 'top',
                                            sx: {
                                              backgroundColor:
                                                'rgba(97, 97, 97, 0.9)',
                                            },
                                            arrow: true,
                                            children: Object(OI.jsx)('div', {
                                              children: Object(OI.jsx)('i', {
                                                onClick: Vi,
                                                id: Va.number,
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
                                Va.id
                              )
                            })
                        : Object(OI.jsx)(OI.Fragment, {}),
                  }),
                ],
              })
            )
          },
          Ax = Object(A3.a)({
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
          Az = function () {
            var Pi = Ax(),
              PD = Object(O4.useState)(''),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(OT.d)(OJ),
              PT = function (PX) {
                void 0 !== Pa &&
                  '' !== Pa &&
                  Ob('sendPlayerPing', {
                    target: Pa,
                    anon: PX,
                  }).then(function (Pv) {
                    Pv && PC('')
                  })
              }
            return (
              OA('closeApps', function () {
                PC('')
              }),
              Object(OI.jsx)(OI.Fragment, {
                children: Object(OI.jsx)('div', {
                  className: Pi.erpingerOuterContainer,
                  style: { zIndex: 500 },
                  children: Object(OI.jsx)('div', {
                    className: Pi.erpingerInnerContainer,
                    children: Object(OI.jsxs)('div', {
                      className: 'erpinger-container',
                      children: [
                        Object(OI.jsx)('div', {
                          className: Pi.erpingerHeader,
                          children: Object(OI.jsx)(OE.a, {
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
                        Object(OI.jsx)('div', {
                          style: {
                            position: 'absolute',
                            top: '20%',
                            left: '50%',
                            transform: 'translate(-50%, -50%)',
                          },
                          children: Object(OI.jsx)(Oo.a, {
                            id: 'input-with-icon-textfield',
                            label: 'Paypal ID',
                            onChange: function (PX) {
                              PC(PX.target.value)
                            },
                            value: Pa,
                            InputProps: {
                              startAdornment: Object(OI.jsx)(Oa.a, {
                                position: 'start',
                                children: Object(OI.jsx)('i', {
                                  className: 'fas fa-id-card',
                                }),
                              }),
                            },
                            variant: 'standard',
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          style: {
                            position: 'absolute',
                            top: '28%',
                            left: '48.2%',
                            transform: 'translate(-50%, -50%)',
                          },
                          children: Object(OI.jsx)(OC.a, {
                            sx: { width: '107.92%' },
                            onClick: function () {
                              return PT(false)
                            },
                            variant: 'contained',
                            color: 'info',
                            size: 'medium',
                            startIcon: Object(OI.jsx)('i', {
                              className: 'fas fa-map-pin',
                            }),
                            children: 'Send Ping',
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          style: {
                            display: PS ? '' : 'none',
                            position: 'absolute',
                            top: '35%',
                            left: '50%',
                            transform: 'translate(-50%, -50%)',
                          },
                          children: Object(OI.jsx)(OC.a, {
                            onClick: function () {
                              return PT(true)
                            },
                            variant: 'contained',
                            color: 'info',
                            size: 'medium',
                            startIcon: Object(OI.jsx)('i', {
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
          AQ = O2(242),
          Ap = function () {
            var Pi = Object(O4.useState)([]),
              PD = Object(O9.a)(Pi, 2),
              Po = PD[0],
              Pa = PD[1],
              PC = Object(O4.useState)([]),
              PS = Object(O9.a)(PC, 2),
              PT = PS[0],
              PX = PS[1]
            return (
              Object(O4.useEffect)(function () {
                Ob('getEmailData', {}).then(function (PL) {
                  Pa(PL)
                  PX(PL)
                })
              }, []),
              OA('updateEmail', function (Pv) {
                Pa(Pv)
                PX(Pv)
              }),
              Object(OI.jsx)(OI.Fragment, {
                children: Object(OI.jsx)(AB, {
                  emptyMessage: 0 === PT.length,
                  primaryActions: [],
                  search: {
                    filter: ['from', 'subject', 'message'],
                    list: Po,
                    onChange: PX,
                  },
                  children:
                    PT && PT.length > 0
                      ? PT.map(function (Pv) {
                          return Object(OI.jsx)('div', {
                            className: 'component-paper cursor-pointer',
                            children: Object(OI.jsxs)('div', {
                              className: 'main-container',
                              children: [
                                Object(OI.jsxs)('div', {
                                  className: 'details',
                                  children: [
                                    Object(OI.jsx)('div', {
                                      className: 'title',
                                      children: Object(OI.jsxs)(OE.a, {
                                        style: {
                                          color: '#fff',
                                          wordBreak: 'break-word',
                                        },
                                        variant: 'body2',
                                        gutterBottom: true,
                                        children: ['From: ', Pv.from],
                                      }),
                                    }),
                                    Object(OI.jsxs)('div', {
                                      className: 'description',
                                      children: [
                                        Object(OI.jsx)('div', {
                                          className: 'flex-row',
                                          children: Object(OI.jsxs)(OE.a, {
                                            style: {
                                              color: '#fff',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                            children: ['Subject: ', Pv.subject],
                                          }),
                                        }),
                                        Object(OI.jsx)('div', {
                                          className: 'flex-row',
                                          children: Object(OI.jsx)(OE.a, {
                                            style: {
                                              color: '#fff',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                            children: Pv.message,
                                          }),
                                        }),
                                      ],
                                    }),
                                    Object(OI.jsx)(AQ.a, {
                                      variant: 'fullWidth',
                                      sx: { borderColor: '#5e6d7d' },
                                    }),
                                    Object(OI.jsx)(OE.a, {
                                      style: {
                                        color: '#fff',
                                        wordBreak: 'break-word',
                                        textAlign: 'center',
                                        marginTop: '5%',
                                      },
                                      variant: 'body2',
                                      gutterBottom: true,
                                      children: Ow()(1000 * Pv.time).fromNow(),
                                    }),
                                  ],
                                }),
                                Object(OI.jsx)('div', { className: 'actions' }),
                              ],
                            }),
                          })
                        })
                      : Object(OI.jsx)(OI.Fragment, {}),
                }),
              })
            )
          },
          AM = Object(A3.a)({
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
          AF = function () {
            var Pi = AM(),
              PD = Object(O4.useState)([]),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(O4.useState)([]),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1],
              Pf = Object(OT.c)(Oj),
              PL = Object(O9.a)(Pf, 2),
              Py = PL[0],
              PU = PL[1],
              Pg = Object(OT.c)(Oq),
              Pc = Object(O9.a)(Pg, 2),
              PJ = (Pc[0], Pc[1]),
              Pj = Object(O4.useState)(false),
              Pq = Object(O9.a)(Pj, 2),
              Pl = Pq[0],
              PN = Pq[1],
              Pr = Object(O4.useState)(false),
              PY = Object(O9.a)(Pr, 2),
              Ps = PY[0],
              Pu = PY[1],
              Pm = Object(O4.useState)(false),
              PW = Object(O9.a)(Pm, 2),
              PR = PW[0],
              Pw = PW[1],
              PZ = Object(O4.useState)(false),
              PH = Object(O9.a)(PZ, 2),
              V0 = PH[0],
              V1 = PH[1],
              V2 = Object(O4.useState)(''),
              V3 = Object(O9.a)(V2, 2),
              V4 = V3[0],
              V5 = V3[1],
              V6 = Object(O4.useState)(false),
              V7 = Object(O9.a)(V6, 2),
              V8 = V7[0],
              V9 = V7[1]
            Object(O4.useEffect)(function () {
              Ob('getYpData', {}).then(function (VV) {
                PC(VV.ads)
                Pv(VV.ads)
                V9(VV.hasAd)
              })
            }, [])
            var VO = function (VP) {
                var Vb = ('' + VP)
                  .replace(/\D/g, '')
                  .match(/^(\d{3})(\d{3})(\d{4})$/)
                return Vb ? '(' + Vb[1] + ') ' + Vb[2] + '-' + Vb[3] : VP
              },
              VA = function (VP) {
                for (
                  var VV = '', Vb = '0123456789', VB = Vb.length, Vh = 0;
                  Vh < VP;
                  Vh++
                ) {
                  VV += Vb.charAt(Math.floor(Math.random() * VB))
                }
                return VV
              }
            return (
              OA('updateYp', function (VP) {
                PC(VP), Pv(VP)
              }),
              OA('closeApps', function () {
                V1(false)
                PN(false)
                Pw(false)
                Pu(false)
                V5('')
              }),
              Object(OI.jsxs)(OI.Fragment, {
                children: [
                  Object(OI.jsx)('div', {
                    className: Pi.ypPostModalContainer,
                    style: { display: V0 ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.ypPostModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Pl ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Ps ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: PR ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Ad',
                                    variant: 'standard',
                                    onChange: function (VP) {
                                      V5(VP.target.value)
                                    },
                                    value: V4,
                                    multiline: true,
                                    maxRows: 10,
                                    inputProps: { maxLength: 255 },
                                    helperText: ''.concat(V4.length, '/255'),
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      V1(false)
                                      V5('')
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      PN(true)
                                      Pw(true)
                                      Ob('postAd', { message: V4 }).then(
                                        function (VP) {
                                          true === VP.success
                                            ? (V5(''),
                                              PC(VP.data),
                                              Pv(VP.data),
                                              V9(VP.hasAd),
                                              PN(false),
                                              Pu(true),
                                              setTimeout(function () {
                                                Pu(false)
                                                V1(false)
                                                Pw(false)
                                              }, 1000))
                                            : (PN(false), Pw(false), V5(''))
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
                  Object(OI.jsx)(AB, {
                    emptyMessage: 0 === PX.length,
                    primaryActions: [
                      {
                        type: 'icon',
                        title: 'Create Ad',
                        placement: 'left',
                        icon: 'fas fa-plus fa-w-16',
                        action: function (VP) {
                          V1(true)
                        },
                        show: !V8,
                      },
                      {
                        type: 'icon',
                        title: 'Remove Ad',
                        placement: 'left',
                        icon: 'fas fa-times fa-w-16',
                        action: function () {
                          Ob('removeYp', {}).then(function (VV) {
                            if (true === VV.success) {
                              PC(VV.data)
                              Pv(VV.data)
                              V9(VV.hasAd)
                            }
                          })
                        },
                        show: V8,
                      },
                    ],
                    search: {
                      filter: ['phonenr', 'message', 'number'],
                      list: Pa,
                      onChange: Pv,
                    },
                    children:
                      PX && PX.length > 0
                        ? PX.map(function (VP) {
                            return Object(OI.jsxs)('div', {
                              className: Pi.ypComponentContainer,
                              children: [
                                Object(OI.jsx)(OE.a, {
                                  style: {
                                    color: '#000',
                                    wordBreak: 'break-word',
                                  },
                                  variant: 'body1',
                                  gutterBottom: true,
                                  children: VP.message,
                                }),
                                Object(OI.jsx)(AQ.a, { variant: 'middle' }),
                                Object(OI.jsxs)('div', {
                                  style: {
                                    fontSize: '13px',
                                    display: 'flex',
                                    paddingBottom: '3vh',
                                  },
                                  children: [
                                    Object(OI.jsx)(Op.a, {
                                      title: 'Call',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)(OE.a, {
                                        onClick: function () {
                                          return (function (Vb) {
                                            Ob('rd-ui:callStart', { number: Vb })
                                            var VB = VA(4),
                                              Vh = Ow()().unix(),
                                              VE = {
                                                id: VB,
                                                number: Vb,
                                                name: Vb,
                                                date: Vh,
                                                state: 'out',
                                              },
                                              Vx = [].concat(
                                                Object(O8.a)(Vk || []),
                                                [VE]
                                              )
                                            PU(Vx)
                                            PJ(Vx)
                                          })(VP.phonenr)
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
                                        children: VO(VP.phonenr),
                                      }),
                                    }),
                                    Object(OI.jsx)(OE.a, {
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
                                      children: VP.name,
                                    }),
                                  ],
                                }),
                              ],
                            })
                          })
                        : Object(OI.jsx)(OI.Fragment, {}),
                  }),
                ],
              })
            )
          },
          AI = Object(A3.a)({
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
          AK = O2(244),
          AG = function (Pd) {
            var PD = Object(O4.useState)(false),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(O4.useState)(false),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1]
            OA('closeApps', function () {
              PC(false), Pv(false)
            })
            var Pf = Pd.message.match(
                /\b(http|https)?(:\/\/)?(\S*)\.(\w{2,4})(.*)/g
              ),
              PL = Pd.message.split(Pf[0])[0],
              Py = '\n\n Images Attached: ' + Pf[0].split(' ').length
            return Object(OI.jsxs)(OI.Fragment, {
              children: [
                Object(OI.jsxs)(OE.a, {
                  style: {
                    color: '#fff',
                    wordBreak: 'break-word',
                  },
                  variant: 'body1',
                  gutterBottom: true,
                  children: ['@', Pd.sender],
                }),
                Object(OI.jsx)(OE.a, {
                  style: {
                    color: '#fff',
                    wordBreak: 'break-word',
                    marginBottom: '0.25em',
                  },
                  variant: 'body2',
                  gutterBottom: true,
                  children: PL,
                }),
                Object(OI.jsxs)('div', {
                  onClick: function () {
                    PC(!Pa)
                  },
                  className: 'component-image-container',
                  style: { marginBottom: '5%' },
                  children: [
                    Object(OI.jsx)('div', {
                      children: Object(OI.jsx)(OE.a, {
                        style: {
                          color: '#fff',
                          wordBreak: 'break-word',
                        },
                        variant: 'body2',
                        gutterBottom: true,
                        children: Py,
                      }),
                    }),
                    Object(OI.jsxs)('div', {
                      className: Pa
                        ? 'container'
                        : 'container container-max-height',
                      children: [
                        Object(OI.jsxs)('div', {
                          className: 'blocker',
                          style: { display: Pa ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('i', {
                              className: 'fas fa-eye fa-w-18 fa-fw fa-3x',
                              style: { color: 'black' },
                            }),
                            Object(OI.jsx)(OE.a, {
                              style: {
                                color: '#fff',
                                wordBreak: 'break-word',
                              },
                              variant: 'body1',
                              gutterBottom: true,
                              children: 'Click to View',
                            }),
                            Object(OI.jsx)(OE.a, {
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
                        Object(OI.jsx)('div', {
                          onMouseEnter: function () {
                            Pa && Pv(true)
                          },
                          onMouseLeave: function () {
                            Pv(false)
                          },
                          className: Pa ? 'image' : '',
                          style: {
                            backgroundImage: Pa
                              ? 'url('.concat(Pf[0].split(' '[0]), ')')
                              : '',
                          },
                        }),
                        Object(OI.jsx)('div', { className: 'spacer' }),
                      ],
                    }),
                    Object(OI.jsx)(AK.a, {
                      open: PX,
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
                      children: Object(OI.jsx)('div', {
                        children: Object(OI.jsx)('img', {
                          alt: 'useful',
                          src: Pf[0].split(' '[0]),
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
          An = function () {
            var Pi = AI(),
              PD = Object(O4.useState)([]),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(O4.useState)([]),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1],
              Pf = Object(O4.useState)(false),
              PL = Object(O9.a)(Pf, 2),
              Py = PL[0],
              PU = PL[1],
              Pg = Object(O4.useState)(false),
              Pc = Object(O9.a)(Pg, 2),
              PJ = Pc[0],
              Pj = Pc[1],
              Pq = Object(O4.useState)(false),
              Pl = Object(O9.a)(Pq, 2),
              PN = Pl[0],
              Pr = Pl[1],
              PY = Object(O4.useState)(false),
              Ps = Object(O9.a)(PY, 2),
              Pu = Ps[0],
              Pm = Ps[1],
              PW = Object(O4.useState)(''),
              PR = Object(O9.a)(PW, 2),
              Pw = PR[0],
              PZ = PR[1],
              PH = Object(O4.useState)(false),
              V0 = Object(O9.a)(PH, 2),
              V1 = (V0[0], V0[1]),
              V2 = Object(O4.useState)(''),
              V3 = Object(O9.a)(V2, 2),
              V4 = (V3[0], V3[1]),
              V5 = Object(OT.c)(OW),
              V6 = Object(O9.a)(V5, 2),
              V7 = V6[0]
            return (
              V6[1],
              Object(O4.useEffect)(function () {
                Ob('getTwitterData', {}).then(function (V9) {
                  PC(V9)
                  Pv(V9)
                })
              }, []),
              (OA('updateTwitter', function (V8) {
                PC(V8)
                Pv(V8)
              }),
              OA('closeApps', function () {
                Pm(false)
                PU(false)
                Pr(false)
                Pj(false)
                V1(false)
                V4('')
                PZ('')
              }),
              Object(OI.jsxs)(OI.Fragment, {
                children: [
                  Object(OI.jsx)('div', {
                    className: Pi.twitterTwatModalContainer,
                    style: { display: Pu ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.twitterTwatModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Py ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: PJ ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: PN ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Twat',
                                    variant: 'standard',
                                    onChange: function (V8) {
                                      PZ(V8.target.value)
                                    },
                                    value: Pw,
                                    multiline: true,
                                    maxRows: 10,
                                    inputProps: { maxLength: 255 },
                                    helperText: ''.concat(Pw.length, '/255'),
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Pm(false)
                                      PZ('')
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      PU(true)
                                      Pr(true)
                                      Ob('postTwitter', { message: Pw }).then(
                                        function (V9) {
                                          true === V9.success
                                            ? (PZ(''),
                                              PC(V9.data),
                                              Pv(V9.data),
                                              PU(false),
                                              Pj(true),
                                              setTimeout(function () {
                                                Pj(false)
                                                Pm(false)
                                                Pr(false)
                                              }, 1000))
                                            : (PU(false),
                                              Pr(false),
                                              V4(V9.message),
                                              V1(true),
                                              PZ(''))
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
                  Object(OI.jsx)(AB, {
                    emptyMessage: 0 === PX.length,
                    primaryActions: [
                      {
                        type: 'icon',
                        title: 'Twat',
                        placement: 'left',
                        icon: 'fab fa-twitter fa-w-16',
                        action: function (V8) {
                          Pm(true)
                        },
                        show: true,
                      },
                    ],
                    search: {
                      filter: ['sender', 'message'],
                      list: Pa,
                      onChange: Pv,
                    },
                    children: Object(OI.jsx)('div', {
                      id: 'twats',
                      children:
                        PX && PX.length > 0
                          ? PX.map(function (V8) {
                              return Object(OI.jsx)(OI.Fragment, {
                                children: Object(OI.jsxs)('div', {
                                  className: Pi.twitterComponentContainer,
                                  children: [
                                    (V8.message.indexOf('imgur.com') >= 0 &&
                                      V7) ||
                                    (V8.message.indexOf('discordapp.com') >= 0 &&
                                      V7)
                                      ? Object(OI.jsx)(AG, {
                                          sender: V8.sender,
                                          message: V8.message,
                                          date: V8.date,
                                        })
                                      : Object(OI.jsxs)(OI.Fragment, {
                                          children: [
                                            Object(OI.jsxs)(OE.a, {
                                              style: {
                                                color: '#fff',
                                                wordBreak: 'break-word',
                                              },
                                              variant: 'body1',
                                              gutterBottom: true,
                                              children: ['@', V8.sender],
                                            }),
                                            Object(OI.jsx)(OE.a, {
                                              style: {
                                                color: '#fff',
                                                wordBreak: 'break-word',
                                                marginBottom: '0.25em',
                                              },
                                              variant: 'body2',
                                              gutterBottom: true,
                                              children: V8.message,
                                            }),
                                          ],
                                        }),
                                    Object(OI.jsxs)('div', {
                                      style: {
                                        fontSize: '13px',
                                        display: 'flex',
                                        paddingBottom: '1vh',
                                      },
                                      children: [
                                        Object(OI.jsx)(Op.a, {
                                          title: 'Reply',
                                          placement: 'top',
                                          sx: {
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('i', {
                                            onClick: function () {
                                              return (
                                                (VA = '@'.concat(V8.sender, ' ')),
                                                PZ(VA),
                                                void Pm(true)
                                              )
                                              var VA
                                            },
                                            className: 'fas fa-reply',
                                          }),
                                        }),
                                        Object(OI.jsx)(Op.a, {
                                          title: 'Retwat',
                                          placement: 'top',
                                          sx: {
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('i', {
                                            onClick: function () {
                                              return (
                                                (VO = 'RT @'
                                                  .concat(V8.sender, ' ')
                                                  .concat(V8.message)),
                                                PZ(VO),
                                                void Pm(true)
                                              )
                                              var VO
                                            },
                                            className: 'fas fa-retweet',
                                            style: { paddingLeft: '1vh' },
                                          }),
                                        }),
                                        Object(OI.jsx)(Op.a, {
                                          title: 'Report',
                                          placement: 'top',
                                          sx: {
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('i', {
                                            className: 'fas fa-flag',
                                            style: { paddingLeft: '1vh' },
                                          }),
                                        }),
                                        Object(OI.jsx)(OE.a, {
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
                                          children: Ow()(
                                            1000 * V8.date
                                          ).fromNow(),
                                        }),
                                      ],
                                    }),
                                  ],
                                }),
                              })
                            })
                          : Object(OI.jsx)(OI.Fragment, {}),
                    }),
                  }),
                ],
              }))
            )
          },
          Ad = O2(266),
          Ai = function (Pd) {
            var PD = Object(O4.useState)(false),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(OT.c)(Oy),
              PT = Object(O9.a)(PS, 2),
              PX = (PT[0], PT[1]),
              Pv = Object(OT.c)(Oc),
              Pf = Object(O9.a)(Pv, 2),
              PL = (Pf[0], Pf[1]),
              Py = (JSON.parse(Pd.damage).engine / 1000) * 100,
              PU = (JSON.parse(Pd.damage).body / 1000) * 100
            return Object(OI.jsx)(OI.Fragment, {
              children: Object(OI.jsxs)('div', {
                className: 'component-paper cursor-pointer',
                onClick: function () {
                  PC(!Pa)
                },
                children: [
                  Object(OI.jsxs)('div', {
                    className: 'main-container',
                    children: [
                      Object(OI.jsx)('div', {
                        className: 'image',
                        children: Object(OI.jsx)('i', {
                          className: 'fas fa-'.concat(
                            Pd.type,
                            ' fa-w-16 fa-fw fa-3x'
                          ),
                        }),
                      }),
                      Object(OI.jsxs)('div', {
                        className: 'details',
                        children: [
                          Object(OI.jsx)('div', {
                            className: 'title',
                            children: Object(OI.jsx)(OE.a, {
                              style: {
                                color: '#fff',
                                wordBreak: 'break-word',
                              },
                              variant: 'body2',
                              gutterBottom: true,
                              children: Pd.plate,
                            }),
                          }),
                          Object(OI.jsx)('div', {
                            className: 'description',
                            children: Object(OI.jsx)('div', {
                              className: 'flex-row',
                              children: Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body2',
                                gutterBottom: true,
                                children: Pd.model,
                              }),
                            }),
                          }),
                        ],
                      }),
                      Object(OI.jsx)('div', { className: 'actions' }),
                      Object(OI.jsx)('div', {
                        className: 'image',
                        children: Object(OI.jsx)(OE.a, {
                          style: {
                            color: '#fff',
                            wordBreak: 'break-word',
                          },
                          variant: 'body2',
                          gutterBottom: true,
                          children: Pd.state,
                        }),
                      }),
                    ],
                  }),
                  Object(OI.jsxs)(Ad.a, {
                    in: Pa,
                    timeout: 'auto',
                    unmountOnExit: true,
                    children: [
                      Object(OI.jsx)(OD.a, {
                        sx: {
                          width: '85%',
                          marginLeft: '7.5%',
                          marginBottom: '1.5%',
                        },
                        children: Object(OI.jsx)(Oo.a, {
                          id: 'input-with-icon-textfield',
                          variant: 'standard',
                          value: Pd.garage,
                          InputProps: {
                            readOnly: true,
                            startAdornment: Object(OI.jsx)(Oa.a, {
                              position: 'start',
                              children: Object(OI.jsx)('i', {
                                className: 'fas fa-map-marker-alt',
                              }),
                            }),
                          },
                        }),
                      }),
                      Object(OI.jsx)(OD.a, {
                        sx: {
                          width: '85%',
                          marginLeft: '7.5%',
                          marginBottom: '1.5%',
                        },
                        children: Object(OI.jsx)(Oo.a, {
                          id: 'input-with-icon-textfield',
                          variant: 'standard',
                          value: Pd.plate,
                          InputProps: {
                            readOnly: true,
                            startAdornment: Object(OI.jsx)(Oa.a, {
                              position: 'start',
                              children: Object(OI.jsx)('i', {
                                className: 'fas fa-closed-captioning',
                              }),
                            }),
                          },
                        }),
                      }),
                      Object(OI.jsx)(OD.a, {
                        sx: {
                          width: '85%',
                          marginLeft: '7.5%',
                          marginBottom: '1.5%',
                        },
                        children: Object(OI.jsx)(Oo.a, {
                          id: 'input-with-icon-textfield',
                          variant: 'standard',
                          value: ''.concat(Py, '%'),
                          InputProps: {
                            readOnly: true,
                            startAdornment: Object(OI.jsx)(Oa.a, {
                              position: 'start',
                              children: Object(OI.jsx)('i', {
                                className: 'fas fa-oil-can',
                              }),
                            }),
                          },
                        }),
                      }),
                      Object(OI.jsx)(OD.a, {
                        sx: {
                          width: '85%',
                          marginLeft: '7.5%',
                          marginBottom: '1.5%',
                        },
                        children: Object(OI.jsx)(Oo.a, {
                          id: 'input-with-icon-textfield',
                          variant: 'standard',
                          value: ''.concat(PU, '%'),
                          InputProps: {
                            readOnly: true,
                            startAdornment: Object(OI.jsx)(Oa.a, {
                              position: 'start',
                              children: Object(OI.jsx)('i', {
                                className: 'fas fa-car-crash',
                              }),
                            }),
                          },
                        }),
                      }),
                      Object(OI.jsx)('div', {
                        className: 'buttons',
                        style: {
                          display: 'flex',
                          justifyContent: 'center',
                          marginTop: '1%',
                        },
                        children: Object(OI.jsxs)(OZ.a, {
                          direction: 'row',
                          spacing: 2,
                          children: [
                            Object(OI.jsx)(OC.a, {
                              id: Pd.plate,
                              onClick: function (Pc) {
                                return (function (Pj) {
                                  Pj.stopPropagation()
                                  Ob('rd-ui:carActionTrack', {
                                    car: { location: Pd.location },
                                  })
                                })(Pc)
                              },
                              size: 'small',
                              color: 'success',
                              variant: 'contained',
                              children: 'Track',
                            }),
                            Object(OI.jsx)(OC.a, {
                              id: Pd.plate,
                              onClick: function (Pc) {
                                return (function (Pj) {
                                  Pj.stopPropagation()
                                  Ob('rd-ui:carActionSpawn', {
                                    car: {
                                      vin: Pd.vin,
                                      plate: Pd.plate,
                                      location: Pd.location,
                                      model: Pd.model,
                                    },
                                  })
                                })(Pc)
                              },
                              size: 'small',
                              color: 'success',
                              variant: 'contained',
                              style: { display: Pd.spawnable ? '' : 'none' },
                              children: 'Spawn',
                            }),
                            Object(OI.jsx)(OC.a, {
                              id: Pd.plate,
                              onClick: function (Pc) {
                                return (function (PJ) {
                                  PJ.stopPropagation()
                                  PX(true)
                                  PL(Pd.plate)
                                })(Pc)
                              },
                              size: 'small',
                              color: 'error',
                              variant: 'contained',
                              style: {
                                display: 'Out' === Pd.state ? '' : 'none',
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
          AD = Object(A3.a)({
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
          Ao = function () {
            var Pi = AD(),
              PD = Object(O4.useState)([]),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(O4.useState)([]),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1],
              Pf = Object(OT.c)(Oy),
              PL = Object(O9.a)(Pf, 2),
              Py = PL[0],
              PU = PL[1],
              Pg = Object(OT.c)(OU),
              Pc = Object(O9.a)(Pg, 2),
              PJ = Pc[0],
              Pj = Pc[1],
              Pq = Object(OT.c)(Og),
              Pl = Object(O9.a)(Pq, 2),
              PN = Pl[0],
              Pr = Pl[1],
              PY = Object(OT.c)(Oc),
              Ps = Object(O9.a)(PY, 2),
              Pu = Ps[0],
              Pm = (Ps[1], Object(O4.useState)(false)),
              PW = Object(O9.a)(Pm, 2),
              PR = PW[0],
              Pw = PW[1],
              PZ = Object(O4.useState)(false),
              PH = Object(O9.a)(PZ, 2),
              V0 = PH[0],
              V1 = PH[1],
              V2 = Object(O4.useState)(false),
              V3 = Object(O9.a)(V2, 2),
              V4 = V3[0],
              V5 = V3[1]
            return (
              Object(O4.useEffect)(function () {
                Ob('rd-ui:getCars', {}).then(function (V8) {
                  PC(V8.data)
                  Pv(V8.data)
                })
              }, []),
              OA('closeApps', function () {
                PU(false)
                Pw(false)
                V1(false)
                V5(false)
              }),
              Object(OI.jsx)(OI.Fragment, {
                children: Object(OI.jsxs)(AB, {
                  emptyMessage: 0 === PX.length,
                  primaryActions: [],
                  search: {
                    filter: ['model', 'plate'],
                    list: Pa,
                    onChange: Pv,
                  },
                  children: [
                    Object(OI.jsx)('div', {
                      className: Pi.garageSellCarModalContainer,
                      style: { display: Py ? '' : 'none' },
                      children: Object(OI.jsxs)('div', {
                        className: Pi.garageSellCarModalInnerContainer,
                        children: [
                          Object(OI.jsx)('div', {
                            className: 'spinner-wrapper',
                            style: { display: PR ? '' : 'none' },
                            children: Object(OI.jsxs)('div', {
                              className: 'lds-spinner',
                              children: [
                                Object(OI.jsx)('div', {}),
                                Object(OI.jsx)('div', {}),
                                Object(OI.jsx)('div', {}),
                                Object(OI.jsx)('div', {}),
                                Object(OI.jsx)('div', {}),
                                Object(OI.jsx)('div', {}),
                                Object(OI.jsx)('div', {}),
                                Object(OI.jsx)('div', {}),
                                Object(OI.jsx)('div', {}),
                                Object(OI.jsx)('div', {}),
                                Object(OI.jsx)('div', {}),
                                Object(OI.jsx)('div', {}),
                              ],
                            }),
                          }),
                          Object(OI.jsx)('div', {
                            className: 'spinner-wrapper',
                            style: { display: V0 ? '' : 'none' },
                            children: Object(OI.jsx)(OS.Checkmark, {
                              size: '56px',
                              color: '#009688',
                            }),
                          }),
                          Object(OI.jsxs)('div', {
                            className: 'component-simple-form',
                            style: { display: PR || V4 ? 'none' : '' },
                            children: [
                              Object(OI.jsx)('div', {
                                children: Object(OI.jsx)('div', {
                                  className: 'input-wrapper',
                                  children: Object(OI.jsx)(OD.a, {
                                    fullWidth: true,
                                    sx: { width: '100%' },
                                    children: Object(OI.jsx)(Oo.a, {
                                      className: Pi.input,
                                      id: 'input-with-icon-textfield',
                                      type: 'number',
                                      label: 'State ID',
                                      variant: 'standard',
                                      onChange: function (V7) {
                                        return Pj(parseInt(V7.target.value))
                                      },
                                      value: PJ,
                                      InputProps: {
                                        startAdornment: Object(OI.jsx)(Oa.a, {
                                          position: 'start',
                                          children: Object(OI.jsx)('i', {
                                            className: 'fas fa-id-card',
                                          }),
                                        }),
                                      },
                                    }),
                                  }),
                                }),
                              }),
                              Object(OI.jsx)('div', {
                                children: Object(OI.jsx)('div', {
                                  className: 'input-wrapper',
                                  children: Object(OI.jsx)(OD.a, {
                                    fullWidth: true,
                                    sx: { width: '100%' },
                                    children: Object(OI.jsx)(Oo.a, {
                                      className: Pi.input,
                                      id: 'input-with-icon-textfield',
                                      type: 'number',
                                      label: 'Price',
                                      variant: 'standard',
                                      onChange: function (V7) {
                                        return Pr(parseInt(V7.target.value))
                                      },
                                      value: PN,
                                      InputProps: {
                                        startAdornment: Object(OI.jsx)(Oa.a, {
                                          position: 'start',
                                          children: Object(OI.jsx)('i', {
                                            className: 'fas fa-dollar-sign',
                                          }),
                                        }),
                                      },
                                    }),
                                  }),
                                }),
                              }),
                              Object(OI.jsxs)('div', {
                                className: 'buttons',
                                children: [
                                  Object(OI.jsx)('div', {
                                    children: Object(OI.jsx)(OC.a, {
                                      onClick: function () {
                                        return PU(false)
                                      },
                                      size: 'small',
                                      color: 'warning',
                                      variant: 'contained',
                                      children: 'Cancel',
                                    }),
                                  }),
                                  Object(OI.jsx)('div', {
                                    children: Object(OI.jsx)(OC.a, {
                                      onClick: function () {
                                        Pw(true)
                                        V5(true)
                                        console.log('sellStateId', PJ)
                                        console.log('sellPrice', PN)
                                        console.log('sellPlate', Pu)
                                        Ob('rd-ui:carActionSell', {
                                          car: { plate: Pu },
                                          stateId: PJ,
                                          price: PN,
                                        }).then(function (V7) {
                                          Pw(false)
                                          V1(true)
                                          setTimeout(function () {
                                            V1(false)
                                            PU(false)
                                            V5(false)
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
                    PX && PX.length > 0
                      ? PX.map(function (V7, V8) {
                          return Object(OI.jsx)(
                            Ai,
                            {
                              vin: V7.vin,
                              plate: V7.plate,
                              model: V7.model,
                              state: V7.state,
                              garage: V7.garage,
                              type: V7.type,
                              spawnable: V7.spawnable,
                              location: V7.location,
                              damage: V7.damage,
                            },
                            V8
                          )
                        })
                      : Object(OI.jsx)(OI.Fragment, {}),
                  ],
                }),
              })
            )
          },
          Aa = O2(252),
          AC = O2(257),
          AS = O2(249),
          AT = Object(A3.a)({
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
          AX = function () {
            var Pd = AT()
            return (
              OA('closeApps', function () {}),
              Object(OI.jsx)(OI.Fragment, {
                children: Object(OI.jsx)('div', {
                  className: Pd.documentsOuterContainer,
                  style: { zIndex: 500 },
                  children: Object(OI.jsx)('div', {
                    className: Pd.documentsOuterContainer,
                    children: Object(OI.jsxs)('div', {
                      className: 'documents-container',
                      children: [
                        Object(OI.jsx)('div', {
                          className: Pd.documentsSearch,
                          children: Object(OI.jsx)('div', {
                            className: Pd.documentsSearchWrapper,
                            children: Object(OI.jsx)('div', {
                              className: 'input-wrapper',
                              children: Object(OI.jsx)(OD.a, {
                                fullWidth: true,
                                sx: { width: '100%' },
                                children: Object(OI.jsx)(Oo.a, {
                                  id: 'input-with-icon-textfield',
                                  label: 'Search',
                                  InputProps: {
                                    startAdornment: Object(OI.jsx)(Oa.a, {
                                      position: 'start',
                                      children: Object(OI.jsx)(Ab.a, {}),
                                    }),
                                  },
                                  variant: 'standard',
                                }),
                              }),
                            }),
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: Pd.documentsIcon,
                          children: Object(OI.jsx)('div', {
                            className: Pd.documentsIconWrapper,
                            children: Object(OI.jsx)(Op.a, {
                              title: 'Create Document',
                              placement: 'left',
                              sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
                              arrow: true,
                              children: Object(OI.jsx)('i', {
                                style: { fontSize: '1.2em' },
                                className: 'fas fa-edit fa-w-16 fa-fw fa-lg',
                              }),
                            }),
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: Pd.documentsSearch,
                          style: {
                            paddingTop: '0px',
                            paddingBottom: '0px',
                            marginBottom: '0px',
                          },
                          children: Object(OI.jsxs)(OD.a, {
                            variant: 'standard',
                            sx: { width: '100%' },
                            children: [
                              Object(OI.jsx)(Aa.a, {
                                id: 'demo-simple-select-label',
                                children: 'Type',
                              }),
                              Object(OI.jsxs)(AS.a, {
                                labelId: 'demo-simple-select-label',
                                id: 'demo-simple-select',
                                label: 'Type',
                                defaultValue: 'notes',
                                children: [
                                  Object(OI.jsx)(AC.a, {
                                    value: 'notes',
                                    children: 'Notes',
                                  }),
                                  Object(OI.jsx)(AC.a, {
                                    value: 'licenses',
                                    children: 'Licenses',
                                  }),
                                  Object(OI.jsx)(AC.a, {
                                    value: 'documents',
                                    children: 'Documents',
                                  }),
                                  Object(OI.jsx)(AC.a, {
                                    value: 'vehicleregistration',
                                    children: 'Vehicle Registration',
                                  }),
                                  Object(OI.jsx)(AC.a, {
                                    value: 'housingdocuments',
                                    children: 'Housing Documents',
                                  }),
                                  Object(OI.jsx)(AC.a, {
                                    value: 'contracts',
                                    children: 'Contracts',
                                  }),
                                ],
                              }),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: Pd.documentsDocs,
                          children: Object(OI.jsx)('div', {
                            className: 'component-paper cursor-pointer',
                            style: { paddingBottom: '0.5%' },
                            children: Object(OI.jsxs)('div', {
                              className: 'main-container',
                              children: [
                                Object(OI.jsx)('div', {
                                  className: 'details',
                                  children: Object(OI.jsx)('div', {
                                    className: 'title',
                                    children: Object(OI.jsx)(OE.a, {
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
                                Object(OI.jsx)('div', {
                                  className: 'image',
                                  style: {
                                    marginRight: '0px',
                                    marginTop: '0px',
                                  },
                                  children: Object(OI.jsx)('i', {
                                    className: 'fas fa-edit fa-w-16 fa-fw fa-1x',
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
          },
          Av = O2(246),
          Af = O2(267),
          AL = Object(A3.a)({
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
          Ay = function (Pd) {
            return Object(OI.jsx)(OI.Fragment, {
              children: Object(OI.jsx)(OD.a, {
                fullWidth: true,
                sx: { width: '100%' },
                children: Object(OI.jsx)(Oo.a, {
                  id: 'outlined-select-currency',
                  variant: 'standard',
                  select: true,
                  label: Pd.label,
                  value: Pd.value,
                  onChange: function (PD) {
                    return Pd.onChange(PD.target.value)
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
                    Pd.items && Pd.items.length > 0
                      ? Pd.items.map(function (PD) {
                          return Object(OI.jsx)(
                            AC.a,
                            {
                              value: PD.id,
                              children: PD.name,
                            },
                            PD.id
                          )
                        })
                      : Object(OI.jsx)(OI.Fragment, {}),
                }),
              }),
            })
          },
          AU = function () {
            var Pi = AL(),
              PD = Object(OT.c)(OX),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(O4.useState)(false),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1],
              Pf = Object(O4.useState)(false),
              PL = Object(O9.a)(Pf, 2),
              Py = PL[0],
              PU = PL[1],
              Pg = Object(O4.useState)(false),
              Pc = Object(O9.a)(Pg, 2),
              PJ = Pc[0],
              Pj = Pc[1],
              Pq = Object(O4.useState)(0),
              Pl = Object(O9.a)(Pq, 2),
              PN = Pl[0],
              Pr = Pl[1],
              PY = Object(O4.useState)(''),
              Ps = Object(O9.a)(PY, 2),
              Pu = Ps[0],
              Pm = Ps[1],
              PW = Object(O4.useState)([]),
              PR = Object(O9.a)(PW, 2),
              Pw = PR[0],
              PZ = PR[1],
              PH = Object(O4.useState)([]),
              V0 = Object(O9.a)(PH, 2),
              V1 = V0[0],
              V2 = V0[1],
              V3 = Object(O4.useState)([]),
              V4 = Object(O9.a)(V3, 2),
              V5 = V4[0],
              V6 = V4[1],
              V7 = Object(O4.useState)(false),
              V8 = Object(O9.a)(V7, 2),
              V9 = V8[0],
              VO = V8[1],
              VA = Object(O4.useState)(false),
              VP = Object(O9.a)(VA, 2),
              VV = VP[0],
              Vb = VP[1],
              VB = Object(O4.useState)(false),
              Vh = Object(O9.a)(VB, 2),
              Vk = Vh[0],
              VE = Vh[1],
              Vx = Object(O4.useState)(''),
              Vz = Object(O9.a)(Vx, 2),
              VQ = Vz[0],
              Vp = Vz[1],
              VM = Object(O4.useState)(''),
              VF = Object(O9.a)(VM, 2),
              VI = VF[0],
              VK = VF[1],
              VG = Object(O4.useState)(0),
              Vn = Object(O9.a)(VG, 2),
              Vd = Vn[0],
              Vi = Vn[1],
              VD = Object(O4.useState)(false),
              Vo = Object(O9.a)(VD, 2),
              Va = Vo[0],
              VC = Vo[1],
              VS = Object(O4.useState)(false),
              VT = Object(O9.a)(VS, 2),
              VX = VT[0],
              Vv = VT[1],
              Vf = Object(O4.useState)(''),
              VL = Object(O9.a)(Vf, 2),
              Vy = VL[0],
              VU = VL[1],
              Vg = Object(OT.c)(Ol),
              Vc = Object(O9.a)(Vg, 2),
              VJ = Vc[0],
              Vj = Vc[1],
              Vq = Object(OT.c)(ON),
              Vl = Object(O9.a)(Vq, 2),
              VN = Vl[0],
              Vr = Vl[1]
            Object(O4.useEffect)(function () {
              Ob('getHousingData', {}).then(function (b1) {
                PZ(b1.owned)
                V2(b1.access)
                V6(b1.available)
                Pr(b1.roomNumber)
                Pm(b1.roomType)
              })
            }, [])
            var VY = O5.a.useState(0),
              Vs = Object(O9.a)(VY, 2),
              Vu = Vs[0],
              Vm = Vs[1],
              VW = function (b1) {
                PC(b1.currentTarget.id)
              },
              VR = function () {
                PC('')
              },
              Vw = function (b1, b2) {
                Ob('manageHousingLocks', {
                  id: b1.currentTarget.id,
                  action: b2,
                }).then(function (b4) {
                  PZ([])
                  V2([])
                  PZ(b4.owned)
                  V2(b4.access)
                })
              },
              Vt = function (b1) {
                Ob('setHousingGps', { id: b1.currentTarget.id })
              },
              VZ = function (b1, b2) {
                console.log('handleEditMode'),
                  PU(false),
                  Vv(false),
                  VU(''),
                  VO(true),
                  Pv(true),
                  Pj(true),
                  setTimeout(function () {
                    b1
                      ? Ob('enterEditMode', { id: b2 }).then(function (b7) {
                          console.log('enterEditMode', b7),
                            true === b7.meta.ok
                              ? (VO(false),
                                Pv(false),
                                Pj(false),
                                Vj(true),
                                Vr(b7.data))
                              : (Pv(false),
                                Pj(false),
                                VU(b7.meta.message),
                                Vv(true),
                                Vr({}))
                        })
                      : Ob('exitEditMode', { id: b2 }).then(function (b7) {
                          console.log('exitEditMode', b7),
                            true === b7.meta.ok
                              ? (VO(false),
                                Pv(false),
                                Pj(false),
                                Vj(false),
                                Vr({}))
                              : (Pv(false),
                                Pj(false),
                                VU(b7.meta.message),
                                Vv(true),
                                Vr({}))
                        })
                  }, 500)
              },
              VH = function (b1) {
                Ob('rd-ui:housingEditPropertyConfig', { type: b1 })
              }
            return (
              OA('closeApps', function () {
                Vb(false)
                VO(false)
                VC(false)
                VE(false)
                Pv(false)
                Pj(false)
                PU(false)
                Vv(false)
                VU('')
              }),
              Object(OI.jsxs)(OI.Fragment, {
                children: [
                  Object(OI.jsx)('div', {
                    className: Pi.housingFoundModalContainer,
                    style: { display: V9 ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.housingFoundModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: PX ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Py ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: PX || PJ ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              style: {
                                justifyContent: 'center',
                                marginBottom: '10px',
                                display: VX ? '' : 'none',
                              },
                              children: Object(OI.jsx)('i', {
                                className: 'fas fa-exclamation fa-2x',
                                style: { color: '#ffa726' },
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: {
                                justifyContent: 'center',
                                display: VX ? '' : 'none',
                              },
                              children: Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body2',
                                gutterBottom: true,
                                children: Vy,
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: { justifyContent: 'center' },
                              children: Object(OI.jsxs)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                  display: VX ? 'none' : '',
                                },
                                variant: 'body2',
                                children: ['Name: ', VQ],
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: { justifyContent: 'center' },
                              children: Object(OI.jsxs)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                  display: VX ? 'none' : '',
                                },
                                variant: 'body2',
                                children: ['Category: ', VI],
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: { justifyContent: 'center' },
                              children: Object(OI.jsxs)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                  display: VX ? 'none' : '',
                                },
                                variant: 'body2',
                                children: [
                                  'Price: ',
                                  Vd.toLocaleString('en-Us', {
                                    style: 'currency',
                                    currency: 'USD',
                                  }),
                                ],
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: { justifyContent: 'center' },
                              children: Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                  display: Va ? '' : 'none',
                                },
                                variant: 'body2',
                                children: 'Already Owned',
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              style: { justifyContent: VX || Va ? 'center' : '' },
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      VO(false)
                                      Vv(false)
                                    },
                                    size: 'small',
                                    color: VX ? 'success' : 'warning',
                                    variant: 'contained',
                                    children: VX ? 'Okay' : 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  style: { display: VX || Va ? 'none' : '' },
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Pv(true)
                                      Pj(true)
                                      Ob('purchaseHousing', {}).then(function (
                                        b1
                                      ) {
                                        true === b1.success
                                          ? (PZ(b1.owned),
                                            setTimeout(function () {
                                              Pv(false)
                                              PU(true)
                                              setTimeout(function () {
                                                PU(false)
                                                VO(false)
                                                Pj(false)
                                              }, 1500)
                                            }, 500))
                                          : (Pv(false),
                                            Pj(false),
                                            VU(b1.owned),
                                            Vv(true))
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
                  Object(OI.jsx)('div', {
                    className: Pi.housingNothingFoundModalContainer,
                    style: { display: VV ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.housingNothingFoundModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: PX ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Py ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: PJ ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              style: {
                                justifyContent: 'center',
                                marginBottom: '10px',
                              },
                              children: Object(OI.jsx)('i', {
                                className: 'fas fa-exclamation fa-2x',
                                style: { color: '#ffa726' },
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: { justifyContent: 'center' },
                              children: Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body2',
                                gutterBottom: true,
                                children: 'No property found',
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              className: 'buttons',
                              style: { justifyContent: 'center' },
                              children: Object(OI.jsx)('div', {
                                children: Object(OI.jsx)(OC.a, {
                                  onClick: function () {
                                    Vb(false)
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
                  Object(OI.jsx)('div', {
                    className: Pi.housingKeysModalContainer,
                    style: { display: Vk ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.housingKeysModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: PX ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Py ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: PX || PJ ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              style: {
                                justifyContent: 'center',
                                marginBottom: '10px',
                                display: VX ? '' : 'none',
                              },
                              children: Object(OI.jsx)('i', {
                                className: 'fas fa-exclamation fa-2x',
                                style: { color: '#ffa726' },
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: {
                                justifyContent: 'center',
                                display: VX ? '' : 'none',
                              },
                              children: Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body2',
                                gutterBottom: true,
                                children: Vy,
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: { display: VX ? 'none' : '' },
                              children: Object(OI.jsxs)('div', {
                                className: 'input-wrapper',
                                children: [
                                  Object(OI.jsx)(OE.a, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'body1',
                                    gutterBottom: true,
                                    children: 'Add:',
                                  }),
                                  Object(OI.jsx)(OD.a, {
                                    fullWidth: true,
                                    sx: { width: '100%' },
                                    children: Object(OI.jsx)(Oo.a, {
                                      id: 'input-with-icon-textfield',
                                      label: 'State ID',
                                      variant: 'standard',
                                      InputProps: {
                                        startAdornment: Object(OI.jsx)(Oa.a, {
                                          position: 'start',
                                          children: Object(OI.jsx)('i', {
                                            className: 'fas fa-id-card',
                                          }),
                                        }),
                                      },
                                    }),
                                  }),
                                ],
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              style: { justifyContent: VX ? 'center' : '' },
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      return VE(false)
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: VX ? 'Close' : 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  style: { display: VX ? 'none' : '' },
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      return VE(false)
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
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: PX || PJ ? 'none' : '' },
                          children: [
                            Object(OI.jsx)(AQ.a, {
                              variant: 'fullWidth',
                              sx: {
                                borderColor: 'rgba(255, 255, 255, 255)',
                                paddingTop: '5%',
                                paddingBottom: '5%',
                              },
                            }),
                            Object(OI.jsx)('div', {
                              style: {
                                justifyContent: 'center',
                                marginBottom: '10px',
                                display: VX ? '' : 'none',
                              },
                              children: Object(OI.jsx)('i', {
                                className: 'fas fa-exclamation fa-2x',
                                style: { color: '#ffa726' },
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: {
                                justifyContent: 'center',
                                display: VX ? '' : 'none',
                              },
                              children: Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body2',
                                gutterBottom: true,
                                children: Vy,
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: { display: VX ? 'none' : '' },
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(Ay, {
                                  label: 'Remove',
                                  value: '',
                                  onChange: function (b1) {},
                                  items: [
                                    {
                                      id: '1',
                                      name: 'Kevin Malagnaggi',
                                    },
                                  ],
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              style: { justifyContent: VX ? 'center' : '' },
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      return VE(false)
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: VX ? 'Close' : 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  style: { display: VX ? 'none' : '' },
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      return VE(false)
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
                  Object(OI.jsx)('div', {
                    className: Pi.housingOuterContainer,
                    style: { zIndex: 500 },
                    children: Object(OI.jsx)('div', {
                      className: Pi.housingInnerContainer,
                      children: Object(OI.jsxs)('div', {
                        className: 'housing-container',
                        children: [
                          Object(OI.jsx)('div', {
                            className: Pi.housingSearch,
                            children: Object(OI.jsx)('div', {
                              className: Pi.housingSearchWrapper,
                              children: Object(OI.jsxs)(Av.a, {
                                centered: true,
                                variant: 'fullWidth',
                                value: Vu,
                                onChange: function (b1, b2) {
                                  Vm(b2)
                                },
                                'aria-label': 'icon tabs example',
                                children: [
                                  Object(OI.jsx)(Af.a, {
                                    icon: Object(OI.jsx)('i', {
                                      className: 'fas fa-house-user fa-lg',
                                    }),
                                    'aria-label': 'apartments',
                                  }),
                                  Object(OI.jsx)(Af.a, {
                                    icon: Object(OI.jsx)('i', {
                                      className: 'fas fa-building fa-lg',
                                    }),
                                    'aria-label': 'properties',
                                  }),
                                ],
                              }),
                            }),
                          }),
                          Object(OI.jsx)('div', {
                            className: Pi.housingIcon,
                            children: Object(OI.jsx)('div', {
                              className: Pi.housingIconWrapper,
                            }),
                          }),
                          Object(OI.jsxs)('div', {
                            className: Pi.housingUpgrades,
                            style: {
                              height: '17.4%',
                              display: 0 === Vu ? '' : 'none',
                            },
                            children: [
                              Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body1',
                                gutterBottom: true,
                                children: 'Current',
                              }),
                              Object(OI.jsx)('div', {
                                className: 'component-paper cursor-pointer',
                                children: Object(OI.jsxs)('div', {
                                  className: 'main-container',
                                  children: [
                                    Object(OI.jsx)('div', {
                                      className: 'image',
                                      children: Object(OI.jsx)('i', {
                                        className:
                                          'fas fa-house-user fa-w-16 fa-fw fa-3x',
                                      }),
                                    }),
                                    Object(OI.jsxs)('div', {
                                      className: 'details',
                                      children: [
                                        Object(OI.jsx)('div', {
                                          className: 'title',
                                          children: Object(OI.jsxs)(OE.a, {
                                            style: {
                                              color: '#fff',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                            children: ['Room: ', PN],
                                          }),
                                        }),
                                        Object(OI.jsx)('div', {
                                          className: 'description',
                                          children: Object(OI.jsx)('div', {
                                            className: 'flex-row',
                                            children: Object(OI.jsx)(OE.a, {
                                              style: {
                                                color: '#fff',
                                                wordBreak: 'break-word',
                                              },
                                              variant: 'body2',
                                              gutterBottom: true,
                                              children: Pu,
                                            }),
                                          }),
                                        }),
                                      ],
                                    }),
                                    Object(OI.jsx)('div', {
                                      className: 'actions',
                                    }),
                                  ],
                                }),
                              }),
                            ],
                          }),
                          Object(OI.jsxs)('div', {
                            className: Pi.housingUpgrades,
                            style: { display: 0 === Vu ? '' : 'none' },
                            children: [
                              Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body1',
                                gutterBottom: true,
                                children: 'Available',
                              }),
                              V5.length &&
                                V5.map(function (b1) {
                                  return Object(OI.jsx)('div', {
                                    id: b1.id,
                                    className: 'component-paper cursor-pointer',
                                    onMouseEnter: VW,
                                    onMouseLeave: VR,
                                    children: Object(OI.jsxs)('div', {
                                      className: 'main-container',
                                      children: [
                                        Object(OI.jsx)('div', {
                                          className: 'image',
                                          children: Object(OI.jsx)('i', {
                                            className:
                                              'fas fa-home fa-w-16 fa-fw fa-3x',
                                          }),
                                        }),
                                        Object(OI.jsxs)('div', {
                                          className: 'details',
                                          children: [
                                            Object(OI.jsx)('div', {
                                              className: 'title',
                                              children: Object(OI.jsx)(OE.a, {
                                                style: {
                                                  color: '#fff',
                                                  wordBreak: 'break-word',
                                                },
                                                variant: 'body2',
                                                gutterBottom: true,
                                                children: b1.price.toLocaleString(
                                                  'en-Us',
                                                  {
                                                    style: 'currency',
                                                    currency: 'USD',
                                                  }
                                                ),
                                              }),
                                            }),
                                            Object(OI.jsx)('div', {
                                              className: 'description',
                                              children: Object(OI.jsx)('div', {
                                                className: 'flex-row',
                                                children: Object(OI.jsx)(OE.a, {
                                                  style: {
                                                    color: '#fff',
                                                    wordBreak: 'break-word',
                                                  },
                                                  variant: 'body2',
                                                  gutterBottom: true,
                                                  children: b1.name,
                                                }),
                                              }),
                                            }),
                                          ],
                                        }),
                                        Object(OI.jsx)('div', {
                                          className:
                                            Pa.toString() === b1.id.toString()
                                              ? 'actions actions-show'
                                              : 'actions',
                                          children: Object(OI.jsx)(Op.a, {
                                            title: 'Upgrade',
                                            placement: 'top',
                                            sx: {
                                              backgroundColor:
                                                'rgba(97, 97, 97, 0.9)',
                                            },
                                            arrow: true,
                                            children: Object(OI.jsx)('div', {
                                              children: Object(OI.jsx)('i', {
                                                id: b1.id,
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
                          Object(OI.jsxs)('div', {
                            className: Pi.housingButtons,
                            style: { display: 1 === Vu ? '' : 'none' },
                            children: [
                              Object(OI.jsx)(OC.a, {
                                onClick: function () {
                                  Ob('checkLocation', {}).then(function (b2) {
                                    true === b2.foundHouse
                                      ? (console.log(
                                          'isOwned',
                                          b2.foundHouseIsOwned
                                        ),
                                        VO(true),
                                        Vp(b2.foundHouseName),
                                        VK(b2.foundHouseCategory),
                                        Vi(b2.foundHousePrice),
                                        VC(b2.foundHouseIsOwned),
                                        Pv(true),
                                        setTimeout(function () {
                                          Pv(false)
                                        }, 500))
                                      : Vb(true)
                                  })
                                },
                                style: { display: VJ ? 'none' : '' },
                                size: 'small',
                                color: 'success',
                                variant: 'contained',
                                children: 'View Current Location',
                              }),
                              Object(OI.jsx)(OC.a, {
                                onClick: function () {
                                  return VZ(false)
                                },
                                style: { display: VJ ? '' : 'none' },
                                size: 'small',
                                color: 'success',
                                variant: 'contained',
                                children: 'Leave Edit Mode',
                              }),
                            ],
                          }),
                          Object(OI.jsx)('div', {
                            style: {
                              display: 1 === Vu && VJ ? '' : 'none',
                              width: '100%',
                              marginBottom: '1vh',
                            },
                            children: Object(OI.jsx)(AQ.a, {
                              variant: 'middle',
                              sx: { borderColor: 'rgba(255, 255, 255, 255)' },
                            }),
                          }),
                          Object(OI.jsxs)('div', {
                            style: {
                              display: 1 === Vu && VJ ? 'flex' : 'none',
                              width: '100%',
                              flexDirection: 'column',
                            },
                            children: [
                              Object(OI.jsx)('div', {
                                style: {
                                  display: VN.garage ? 'flex' : 'none',
                                  justifyContent: 'center',
                                  marginBottom: '1vh',
                                },
                                children: Object(OI.jsx)(OC.a, {
                                  onClick: function () {
                                    return VH('garage')
                                  },
                                  size: 'small',
                                  color: 'success',
                                  variant: 'contained',
                                  children: 'Place Garage Here',
                                }),
                              }),
                              Object(OI.jsx)('div', {
                                style: {
                                  display: VN.stash ? 'flex' : 'none',
                                  justifyContent: 'center',
                                  marginBottom: '1vh',
                                },
                                children: Object(OI.jsx)(OC.a, {
                                  onClick: function () {
                                    return VH('inventory')
                                  },
                                  size: 'small',
                                  color: 'success',
                                  variant: 'contained',
                                  children: 'Place Stash Here',
                                }),
                              }),
                              Object(OI.jsx)('div', {
                                style: {
                                  display: VN.backdoor ? 'flex' : 'none',
                                  justifyContent: 'center',
                                  marginBottom: '1vh',
                                },
                                children: Object(OI.jsx)(OC.a, {
                                  onClick: function () {
                                    return VH('backdoor')
                                  },
                                  size: 'small',
                                  color: 'success',
                                  variant: 'contained',
                                  children: 'Place Backdoor Here',
                                }),
                              }),
                              Object(OI.jsx)('div', {
                                style: {
                                  display: VN.wardrobe ? 'flex' : 'none',
                                  justifyContent: 'center',
                                  marginBottom: '1vh',
                                },
                                children: Object(OI.jsx)(OC.a, {
                                  onClick: function () {
                                    return VH('char-changer')
                                  },
                                  size: 'small',
                                  color: 'success',
                                  variant: 'contained',
                                  children: 'Place Wardrobe Here',
                                }),
                              }),
                              Object(OI.jsx)('div', {
                                style: {
                                  display: VN.furniture ? 'flex' : 'none',
                                  justifyContent: 'center',
                                  marginBottom: '1vh',
                                },
                                children: Object(OI.jsx)(OC.a, {
                                  onClick: function () {
                                    return VH('furniture')
                                  },
                                  size: 'small',
                                  color: 'success',
                                  variant: 'contained',
                                  children: 'Open Furniture',
                                }),
                              }),
                            ],
                          }),
                          Object(OI.jsxs)('div', {
                            className: Pi.housingUpgrades,
                            style: {
                              height: 'fit-content',
                              display: 1 !== Vu || VJ ? 'none' : '',
                            },
                            onMouseEnter: VW,
                            onMouseLeave: VR,
                            children: [
                              Object(OI.jsx)('div', {
                                style: {
                                  display: 'flex',
                                  justifyContent: 'center',
                                },
                                children: Object(OI.jsx)(OC.a, {
                                  size: 'small',
                                  color: 'success',
                                  variant: 'contained',
                                  children: Object(OI.jsx)('i', {
                                    className: 'fas fa-edit',
                                    style: { color: '#000' },
                                  }),
                                }),
                              }),
                              Object(OI.jsx)(OE.a, {
                                style: {
                                  display: Pw.length > 0 && !VJ ? '' : 'none',
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                  marginTop: '5px',
                                },
                                variant: 'body1',
                                gutterBottom: true,
                                children: 'Owned',
                              }),
                              Pw && Pw.length > 0 && !VJ
                                ? Pw.map(function (b1) {
                                    return Object(OI.jsx)('div', {
                                      id: b1.property_id,
                                      className: 'component-paper cursor-pointer',
                                      onMouseEnter: VW,
                                      onMouseLeave: VR,
                                      children: Object(OI.jsxs)('div', {
                                        className: 'main-container',
                                        children: [
                                          Object(OI.jsx)('div', {
                                            className: 'image',
                                            children: Object(OI.jsx)('i', {
                                              className: 'fas '.concat(
                                                'warehouse' === b1.category
                                                  ? 'fa-warehouse'
                                                  : 'fa-home',
                                                ' fa-w-16 fa-fw fa-3x'
                                              ),
                                            }),
                                          }),
                                          Object(OI.jsxs)('div', {
                                            className: 'details',
                                            children: [
                                              Object(OI.jsx)('div', {
                                                className: 'title',
                                                children: Object(OI.jsx)(OE.a, {
                                                  style: {
                                                    color: '#fff',
                                                    wordBreak: 'break-word',
                                                  },
                                                  variant: 'body2',
                                                  gutterBottom: true,
                                                  children: b1.propertyname,
                                                }),
                                              }),
                                              Object(OI.jsx)('div', {
                                                className: 'description',
                                                children: Object(OI.jsx)('div', {
                                                  className: 'flex-row',
                                                  children: Object(OI.jsx)(OE.a, {
                                                    style: {
                                                      color: '#fff',
                                                      wordBreak: 'break-word',
                                                    },
                                                    variant: 'body2',
                                                    gutterBottom: true,
                                                    children:
                                                      'warehouse' === b1.category
                                                        ? 'warehouse'
                                                        : 'housing',
                                                  }),
                                                }),
                                              }),
                                            ],
                                          }),
                                          Object(OI.jsxs)('div', {
                                            className:
                                              Pa.toString() ===
                                              b1.property_id.toString()
                                                ? 'actions actions-show'
                                                : 'actions',
                                            children: [
                                              Object(OI.jsx)(Op.a, {
                                                title: 'Set GPS',
                                                placement: 'top',
                                                sx: {
                                                  backgroundColor:
                                                    'rgba(97, 97, 97, 0.9)',
                                                },
                                                arrow: true,
                                                children: Object(OI.jsx)('div', {
                                                  children: Object(OI.jsx)('i', {
                                                    id: b1.property_id,
                                                    onClick: function (b3) {
                                                      return Vt(b3)
                                                    },
                                                    className:
                                                      'fas fa-map-marked fa-w-16 fa-fw fa-lg',
                                                  }),
                                                }),
                                              }),
                                              Object(OI.jsx)(Op.a, {
                                                title: b1.locked
                                                  ? 'Unlock'
                                                  : 'Lock',
                                                placement: 'top',
                                                sx: {
                                                  backgroundColor:
                                                    'rgba(97, 97, 97, 0.9)',
                                                },
                                                arrow: true,
                                                children: Object(OI.jsx)('div', {
                                                  children: Object(OI.jsx)('i', {
                                                    id: b1.property_id,
                                                    onClick: function (b3) {
                                                      return Vw(
                                                        b3,
                                                        b1.locked
                                                          ? 'unlock'
                                                          : 'lock'
                                                      )
                                                    },
                                                    className: 'fas '.concat(
                                                      b1.locked
                                                        ? 'fa-lock'
                                                        : 'fa-lock-open',
                                                      ' fa-w-16 fa-fw fa-lg'
                                                    ),
                                                  }),
                                                }),
                                              }),
                                              Object(OI.jsx)(Op.a, {
                                                title: 'Edit Property',
                                                placement: 'top',
                                                sx: {
                                                  backgroundColor:
                                                    'rgba(97, 97, 97, 0.9)',
                                                },
                                                arrow: true,
                                                children: Object(OI.jsx)('div', {
                                                  children: Object(OI.jsx)('i', {
                                                    onClick: function () {
                                                      return VZ(
                                                        true,
                                                        b1.property_id
                                                      )
                                                    },
                                                    className:
                                                      'fas fa-edit fa-w-16 fa-fw fa-lg',
                                                  }),
                                                }),
                                              }),
                                              Object(OI.jsx)(Op.a, {
                                                title: 'Keys',
                                                placement: 'top',
                                                sx: {
                                                  backgroundColor:
                                                    'rgba(97, 97, 97, 0.9)',
                                                },
                                                arrow: true,
                                                children: Object(OI.jsx)('div', {
                                                  children: Object(OI.jsx)('i', {
                                                    onClick: function () {
                                                      return VE(true)
                                                    },
                                                    className:
                                                      'fas fa-key fa-w-16 fa-fw fa-lg',
                                                  }),
                                                }),
                                              }),
                                            ],
                                          }),
                                        ],
                                      }),
                                    })
                                  })
                                : Object(OI.jsx)(OI.Fragment, {}),
                            ],
                          }),
                          Object(OI.jsxs)('div', {
                            className: Pi.housingUpgrades,
                            style: { display: 1 === Vu ? '' : 'none' },
                            children: [
                              Object(OI.jsx)('div', {
                                style: { marginTop: '5px' },
                                children: Object(OI.jsx)(OE.a, {
                                  style: {
                                    display: V1.length > 0 && !VJ ? '' : 'none',
                                    color: '#fff',
                                    wordBreak: 'break-word',
                                  },
                                  variant: 'body1',
                                  gutterBottom: true,
                                  children: 'Access',
                                }),
                              }),
                              V1 && V1.length > 0 && !VJ
                                ? V1.map(function (b1) {
                                    return Object(OI.jsx)('div', {
                                      id: b1.property_id,
                                      className: 'component-paper cursor-pointer',
                                      onMouseEnter: VW,
                                      onMouseLeave: VR,
                                      children: Object(OI.jsxs)('div', {
                                        className: 'main-container',
                                        children: [
                                          Object(OI.jsx)('div', {
                                            className: 'image',
                                            children: Object(OI.jsx)('i', {
                                              className: 'fas '.concat(
                                                'warehouse' === b1.category
                                                  ? 'fa-warehouse'
                                                  : 'fa-home',
                                                ' fa-w-16 fa-fw fa-3x'
                                              ),
                                            }),
                                          }),
                                          Object(OI.jsxs)('div', {
                                            className: 'details',
                                            children: [
                                              Object(OI.jsx)('div', {
                                                className: 'title',
                                                children: Object(OI.jsx)(OE.a, {
                                                  style: {
                                                    color: '#fff',
                                                    wordBreak: 'break-word',
                                                  },
                                                  variant: 'body2',
                                                  gutterBottom: true,
                                                  children: b1.propertyname,
                                                }),
                                              }),
                                              Object(OI.jsx)('div', {
                                                className: 'description',
                                                children: Object(OI.jsx)('div', {
                                                  className: 'flex-row',
                                                  children: Object(OI.jsx)(OE.a, {
                                                    style: {
                                                      color: '#fff',
                                                      wordBreak: 'break-word',
                                                    },
                                                    variant: 'body2',
                                                    gutterBottom: true,
                                                    children:
                                                      'warehouse' === b1.category
                                                        ? 'warehouse'
                                                        : 'housing',
                                                  }),
                                                }),
                                              }),
                                            ],
                                          }),
                                          Object(OI.jsxs)('div', {
                                            className:
                                              Pa.toString() ===
                                              b1.property_id.toString()
                                                ? 'actions actions-show'
                                                : 'actions',
                                            children: [
                                              Object(OI.jsx)(Op.a, {
                                                title: 'Set GPS',
                                                placement: 'top',
                                                sx: {
                                                  backgroundColor:
                                                    'rgba(97, 97, 97, 0.9)',
                                                },
                                                arrow: true,
                                                children: Object(OI.jsx)('div', {
                                                  children: Object(OI.jsx)('i', {
                                                    id: b1.property_id,
                                                    onClick: function (b2) {
                                                      return Vt(b2)
                                                    },
                                                    className:
                                                      'fas fa-map-marked fa-w-16 fa-fw fa-lg',
                                                  }),
                                                }),
                                              }),
                                              Object(OI.jsx)(Op.a, {
                                                title: b1.locked
                                                  ? 'Unlock'
                                                  : 'Lock',
                                                placement: 'top',
                                                sx: {
                                                  backgroundColor:
                                                    'rgba(97, 97, 97, 0.9)',
                                                },
                                                arrow: true,
                                                children: Object(OI.jsx)('div', {
                                                  children: Object(OI.jsx)('i', {
                                                    id: b1.property_id,
                                                    onClick: function (b2) {
                                                      return Vw(
                                                        b2,
                                                        b1.locked
                                                          ? 'unlock'
                                                          : 'lock'
                                                      )
                                                    },
                                                    className: 'fas '.concat(
                                                      b1.locked
                                                        ? 'fa-lock'
                                                        : 'fa-lock-open',
                                                      ' fa-w-16 fa-fw fa-lg'
                                                    ),
                                                  }),
                                                }),
                                              }),
                                            ],
                                          }),
                                        ],
                                      }),
                                    })
                                  })
                                : Object(OI.jsx)(OI.Fragment, {}),
                            ],
                          }),
                        ],
                      }),
                    }),
                  }),
                ],
              })
            )
          },
          Ag = Object(A3.a)({
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
          Ac = function (Pd) {
            var PD = Object(O4.useState)(false),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(OT.c)(Ov),
              PT = Object(O9.a)(PS, 2),
              PX = (PT[0], PT[1]),
              Pv = Object(OT.c)(Of),
              Pf = Object(O9.a)(Pv, 2),
              PL = (Pf[0], Pf[1]),
              Py = Object(OT.c)(OL),
              PU = Object(O9.a)(Py, 2),
              Pg = (PU[0], PU[1])
            return Object(OI.jsx)(OI.Fragment, {
              children: Object(OI.jsxs)('div', {
                className: 'component-paper cursor-pointer',
                onClick: function () {
                  PC(!Pa)
                },
                children: [
                  Object(OI.jsxs)('div', {
                    className: 'main-container',
                    children: [
                      Object(OI.jsx)('div', {
                        className: 'image',
                        children: Object(OI.jsx)('i', {
                          className: ''.concat(Pd.icon, ' fa-w-16 fa-fw fa-3x'),
                        }),
                      }),
                      Object(OI.jsxs)('div', {
                        className: 'details',
                        children: [
                          Object(OI.jsx)('div', {
                            className: 'title',
                            children: Object(OI.jsx)(OE.a, {
                              style: {
                                color: '#fff',
                                wordBreak: 'break-word',
                              },
                              variant: 'body2',
                              gutterBottom: true,
                              children: Pd.name,
                            }),
                          }),
                          Object(OI.jsx)('div', {
                            className: 'description',
                            children: Object(OI.jsx)('div', {
                              className: 'flex-row',
                              children: Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body2',
                                gutterBottom: true,
                                children: void 0 === Pd.amount ? '0' : Pd.amount,
                              }),
                            }),
                          }),
                        ],
                      }),
                      Object(OI.jsx)('div', { className: 'actions' }),
                    ],
                  }),
                  Object(OI.jsxs)(Ad.a, {
                    in: Pa,
                    timeout: 'auto',
                    unmountOnExit: true,
                    children: [
                      Object(OI.jsx)(OD.a, {
                        sx: {
                          width: '85%',
                          marginLeft: '7.5%',
                          marginBottom: '1.5%',
                        },
                        children: Object(OI.jsx)(Oo.a, {
                          id: 'input-with-icon-textfield',
                          variant: 'standard',
                          value: ''.concat(Pd.tag, ' (').concat(Pd.id, ')'),
                          InputProps: {
                            readOnly: true,
                            startAdornment: Object(OI.jsx)(Oa.a, {
                              position: 'start',
                              children: Object(OI.jsx)('i', {
                                className: 'fas fa-id-card',
                              }),
                            }),
                          },
                        }),
                      }),
                      Object(OI.jsx)(OD.a, {
                        sx: {
                          width: '85%',
                          marginLeft: '7.5%',
                          marginBottom: '1.5%',
                        },
                        children: Object(OI.jsx)(Oo.a, {
                          id: 'input-with-icon-textfield',
                          variant: 'standard',
                          value: Pd.name,
                          InputProps: {
                            readOnly: true,
                            startAdornment: Object(OI.jsx)(Oa.a, {
                              position: 'start',
                              children: Object(OI.jsx)('i', {
                                className: 'fas fa-tag',
                              }),
                            }),
                          },
                        }),
                      }),
                      Object(OI.jsx)(OD.a, {
                        sx: {
                          width: '85%',
                          marginLeft: '7.5%',
                          marginBottom: '1.5%',
                        },
                        children: Object(OI.jsx)(Oo.a, {
                          id: 'input-with-icon-textfield',
                          variant: 'standard',
                          value: void 0 === Pd.amount ? '0' : Pd.amount,
                          InputProps: {
                            readOnly: true,
                            startAdornment: Object(OI.jsx)(Oa.a, {
                              position: 'start',
                              children: Object(OI.jsx)('i', {
                                className: 'fas fa-money-check-alt',
                              }),
                            }),
                          },
                        }),
                      }),
                      Object(OI.jsx)(OD.a, {
                        sx: {
                          width: '85%',
                          marginLeft: '7.5%',
                          marginBottom: '1.5%',
                        },
                        children: Object(OI.jsx)(Oo.a, {
                          id: 'input-with-icon-textfield',
                          variant: 'standard',
                          value: Pd.value.toLocaleString('en-Us', {
                            style: 'currency',
                            currency: 'USD',
                          }),
                          InputProps: {
                            readOnly: true,
                            startAdornment: Object(OI.jsx)(Oa.a, {
                              position: 'start',
                              children: Object(OI.jsx)('i', {
                                className: 'fas fa-poll',
                              }),
                            }),
                          },
                        }),
                      }),
                      Object(OI.jsxs)(OZ.a, {
                        direction: 'row',
                        sx: {
                          marginTop: '1%',
                          marginLeft: '7.5%',
                        },
                        children: [
                          Object(OI.jsx)(OC.a, {
                            onClick: function (Pc) {
                              Pc.stopPropagation()
                              Pg(Pd.id)
                              PX(true)
                            },
                            style: {
                              display: Pd.buyable ? '' : 'none',
                              marginRight: '8.1%',
                            },
                            size: 'small',
                            color: 'success',
                            variant: 'contained',
                            children: 'Purchase',
                          }),
                          Object(OI.jsx)(OC.a, {
                            onClick: function (Pc) {
                              Pc.stopPropagation()
                              Pg(Pd.id)
                              PL(true)
                            },
                            style: {
                              display: Pd.exchangeable ? '' : 'none',
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
          AJ = function () {
            var Pi = Ag(),
              PD = Object(O4.useState)([]),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(O4.useState)([]),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1],
              Pf = Object(O4.useState)(''),
              PL = Object(O9.a)(Pf, 2),
              Py = PL[0],
              PU = PL[1],
              Pg = Object(O4.useState)(''),
              Pc = Object(O9.a)(Pg, 2),
              PJ = Pc[0],
              Pj = Pc[1],
              Pq = Object(O4.useState)(''),
              Pl = Object(O9.a)(Pq, 2),
              PN = Pl[0],
              Pr = Pl[1],
              PY = Object(OT.d)(Ov),
              Ps = Object(OT.c)(Ov),
              Pu = Object(O9.a)(Ps, 2),
              Pm = (Pu[0], Pu[1]),
              PW = Object(OT.d)(Of),
              PR = Object(OT.c)(Of),
              Pw = Object(O9.a)(PR, 2),
              PZ = (Pw[0], Pw[1]),
              PH = Object(OT.d)(OL),
              V0 = Object(O4.useState)(false),
              V1 = Object(O9.a)(V0, 2),
              V2 = V1[0],
              V3 = V1[1],
              V4 = Object(O4.useState)(false),
              V5 = Object(O9.a)(V4, 2),
              V6 = V5[0],
              V7 = V5[1],
              V8 = Object(O4.useState)(false),
              V9 = Object(O9.a)(V8, 2),
              VO = V9[0],
              VA = V9[1],
              VP = Object(O4.useState)(false),
              VV = Object(O9.a)(VP, 2),
              Vb = VV[0],
              VB = VV[1],
              Vh = Object(O4.useState)(false),
              Vk = Object(O9.a)(Vh, 2),
              VE = Vk[0],
              Vx = Vk[1],
              Vz = Object(O4.useState)(false),
              VQ = Object(O9.a)(Vz, 2),
              Vp = VQ[0],
              VM = VQ[1],
              VF = Object(O4.useState)(false),
              VI = Object(O9.a)(VF, 2),
              VK = VI[0],
              VG = VI[1],
              Vn = Object(O4.useState)(''),
              Vd = Object(O9.a)(Vn, 2),
              Vi = Vd[0],
              VD = Vd[1]
            return (
              Object(O4.useEffect)(function () {
                Ob('getCryptoData', {}).then(function (Va) {
                  PC(Va)
                  Pv(Va)
                })
              }, []),
              OA('closeApps', function () {
                V3(false),
                  V7(false),
                  VA(false),
                  VB(false),
                  Vx(false),
                  VM(false),
                  VG(false),
                  Pm(false),
                  PZ(false),
                  PU(''),
                  Pj(''),
                  Pr('')
              }),
              Object(OI.jsxs)(OI.Fragment, {
                children: [
                  Object(OI.jsx)('div', {
                    className: Pi.cryptoPurchaseModalContainer,
                    style: { display: PY ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.cryptoPurchaseModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: V2 ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: V6 ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: V2 || VO ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              style: {
                                justifyContent: 'center',
                                marginBottom: '10px',
                                display: Vb ? '' : 'none',
                              },
                              children: Object(OI.jsx)('i', {
                                className: 'fas fa-exclamation fa-2x',
                                style: { color: '#ffa726' },
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: {
                                justifyContent: 'center',
                                display: Vb ? '' : 'none',
                              },
                              children: Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body2',
                                gutterBottom: true,
                                children: Vi,
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: { display: Vb ? 'none' : '' },
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    className: Pi.input,
                                    id: 'input-with-icon-textfield',
                                    type: 'number',
                                    label: 'Amount',
                                    variant: 'standard',
                                    onChange: function (Vo) {
                                      PU(Vo.target.value)
                                    },
                                    value: Py,
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-sliders-h',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              className: 'validation-messages',
                              style: { display: VE ? '' : 'none' },
                              children: Object(OI.jsxs)('div', {
                                className: 'message',
                                style: { display: VE && VK ? '' : 'none' },
                                children: [
                                  Object(OI.jsx)('i', {
                                    className:
                                      'fas fa-exclamation fa-w-6 fa-fw fa-sm',
                                  }),
                                  Object(OI.jsx)(OE.a, {
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
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              style: { justifyContent: Vb ? 'center' : '' },
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Pm(false),
                                        VB(false),
                                        Vx(false),
                                        VG(false),
                                        PU('')
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: Vb ? 'Close' : 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  style: { display: Vb ? 'none' : '' },
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      if (0 === Py.length) {
                                        return Vx(true), void VG(true)
                                      }
                                      V3(true)
                                      VA(true)
                                      Ob('purchaseCrypto', {
                                        id: PH,
                                        amount: Py,
                                      }).then(function (Vo) {
                                        true === Vo.success
                                          ? (PU(''),
                                            PC(Vo.data),
                                            Pv(Vo.data),
                                            Vx(false),
                                            setTimeout(function () {
                                              V3(false)
                                              V7(true)
                                              setTimeout(function () {
                                                V7(false)
                                                Pm(false)
                                                VA(false)
                                              }, 1500)
                                            }, 500))
                                          : (V3(false),
                                            VA(false),
                                            VD(Vo.message),
                                            VB(true),
                                            PU(''),
                                            Vx(false))
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
                  Object(OI.jsx)('div', {
                    className: Pi.cryptoExchangeModalContainer,
                    style: { display: PW ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.cryptoExchangeModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: V2 ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: V6 ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: V2 || VO ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              style: {
                                justifyContent: 'center',
                                marginBottom: '10px',
                                display: Vb ? '' : 'none',
                              },
                              children: Object(OI.jsx)('i', {
                                className: 'fas fa-exclamation fa-2x',
                                style: { color: '#ffa726' },
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: {
                                justifyContent: 'center',
                                display: Vb ? '' : 'none',
                              },
                              children: Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body2',
                                gutterBottom: true,
                                children: Vi,
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: { display: Vb ? 'none' : '' },
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    className: Pi.input,
                                    id: 'input-with-icon-textfield',
                                    label: 'Crypto ID',
                                    type: 'number',
                                    variant: 'standard',
                                    value: PH,
                                    InputProps: {
                                      readOnly: true,
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-id-card',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: { display: Vb ? 'none' : '' },
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Phone Number',
                                    type: 'tel',
                                    variant: 'standard',
                                    onChange: function (Vo) {
                                      Pj(Vo.target.value)
                                    },
                                    value: PJ,
                                    inputProps: { maxLength: 10 },
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-phone-volume',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              style: { display: Vb ? 'none' : '' },
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    className: Pi.input,
                                    id: 'input-with-icon-textfield',
                                    label: 'Amount',
                                    type: 'number',
                                    variant: 'standard',
                                    onChange: function (Vo) {
                                      Pr(Vo.target.value)
                                    },
                                    value: PN,
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-sliders-h',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'validation-messages',
                              style: { display: VE ? '' : 'none' },
                              children: [
                                Object(OI.jsxs)('div', {
                                  className: 'message',
                                  style: { display: VE && Vp ? '' : 'none' },
                                  children: [
                                    Object(OI.jsx)('i', {
                                      className:
                                        'fas fa-exclamation fa-w-6 fa-fw fa-sm',
                                    }),
                                    Object(OI.jsx)(OE.a, {
                                      style: {
                                        color: '#fff',
                                        wordBreak: 'break-word',
                                      },
                                      variant: 'body2',
                                      gutterBottom: true,
                                      children: 'Phone Number must be 10 numbers',
                                    }),
                                  ],
                                }),
                                Object(OI.jsxs)('div', {
                                  className: 'message',
                                  style: { display: VE && VK ? '' : 'none' },
                                  children: [
                                    Object(OI.jsx)('i', {
                                      className:
                                        'fas fa-exclamation fa-w-6 fa-fw fa-sm',
                                    }),
                                    Object(OI.jsx)(OE.a, {
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
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              style: { justifyContent: Vb ? 'center' : '' },
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      PZ(false)
                                      VB(false)
                                      Vx(false)
                                      VM(false)
                                      VG(false)
                                      Pj('')
                                      Pr('')
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: Vb ? 'Close' : 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  style: { display: Vb ? 'none' : '' },
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      return 0 === PJ.length && 0 === PN.length
                                        ? (Vx(true), VM(true), void VG(true))
                                        : (Vx(false),
                                          VM(false),
                                          VG(false),
                                          0 === PJ.length && 0 !== PN.length
                                            ? (Vx(true), void VM(true))
                                            : (Vx(false),
                                              VM(false),
                                              0 === PN.length && 0 !== PJ.length
                                                ? (Vx(true), void VG(true))
                                                : (Vx(false),
                                                  VG(false),
                                                  PJ.length < 10
                                                    ? (Vx(true), void VM(true))
                                                    : (Vx(false),
                                                      VM(false),
                                                      Vx(false),
                                                      VM(false),
                                                      VG(false),
                                                      V3(true),
                                                      VA(true),
                                                      void Ob('exchangeCrypto', {
                                                        id: PH,
                                                        number: PJ,
                                                        amount: PN,
                                                      }).then(function (VC) {
                                                        true === VC.success
                                                          ? (Pj(''),
                                                            Pr(''),
                                                            PC(VC.data),
                                                            Pv(VC.data),
                                                            setTimeout(
                                                              function () {
                                                                V3(false)
                                                                V7(true)
                                                                setTimeout(
                                                                  function () {
                                                                    V7(false)
                                                                    PZ(false)
                                                                    VA(false)
                                                                  },
                                                                  1500
                                                                )
                                                              },
                                                              500
                                                            ))
                                                          : (V3(false),
                                                            VA(false),
                                                            VD(VC.message),
                                                            VB(true),
                                                            Pj(''),
                                                            Pr(''))
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
                  Object(OI.jsx)(AB, {
                    emptyMessage: 0 === PX.length,
                    primaryActions: [],
                    search: {
                      filter: ['name'],
                      list: Pa,
                      onChange: Pv,
                    },
                    children:
                      PX && PX.length > 0
                        ? PX.map(function (Vo, Va) {
                            return Object(OI.jsx)(
                              Ac,
                              {
                                id: Vo.id,
                                icon: Vo.icon,
                                name: Vo.name,
                                amount: Vo.amount,
                                tag: Vo.tag,
                                value: Vo.value,
                                buyable: Vo.canbuy,
                                exchangeable: Vo.canexchange,
                                sellable: Vo.cansell,
                              },
                              Va
                            )
                          })
                        : Object(OI.jsx)(OI.Fragment, {}),
                  }),
                ],
              })
            )
          },
          Aj = O2(268),
          Aq = O2(248),
          Al = Object(A3.a)({
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
          AN = function (Pd) {
            var PD = Object(OT.c)(OX),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(O4.useState)(false),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1]
            return Object(OI.jsx)(OI.Fragment, {
              children: Object(OI.jsxs)(
                'div',
                {
                  id: Pd.id,
                  className: 'component-paper cursor-pointer',
                  onClick: function () {
                    Pv(!PX)
                  },
                  onMouseEnter: function (Pf) {
                    PC(Pf.currentTarget.id)
                  },
                  onMouseLeave: function () {
                    PC('')
                  },
                  children: [
                    Object(OI.jsxs)('div', {
                      className: 'main-container',
                      children: [
                        Object(OI.jsxs)('div', {
                          className: 'details',
                          children: [
                            Object(OI.jsx)('div', {
                              className: 'title',
                              children: Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body2',
                                gutterBottom: true,
                                children: Pd.name,
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              className: 'description',
                              children: Object(OI.jsxs)('div', {
                                className: 'flex-row',
                                style: { justifyContent: 'space-between' },
                                children: [
                                  Object(OI.jsx)(OE.a, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'body2',
                                    gutterBottom: true,
                                    children: Pd.lapText,
                                  }),
                                  Object(OI.jsx)(OE.a, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'body2',
                                    gutterBottom: true,
                                    children: Pd.distText,
                                  }),
                                ],
                              }),
                            }),
                          ],
                        }),
                        Object(OI.jsx)('div', {
                          className:
                            Pa.toString() === Pd.id.toString() &&
                            Pd.cid.toString() === Pd.data.owner.toString() &&
                            'active' === Pd.type
                              ? 'actions actions-show'
                              : 'actions',
                          children: Object(OI.jsx)(Op.a, {
                            title: 'End Race',
                            placement: 'top',
                            sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
                            arrow: true,
                            children: Object(OI.jsx)('div', {
                              style: {
                                display:
                                  Pd.cid.toString() === Pd.data.owner.toString()
                                    ? ''
                                    : 'none',
                              },
                              children: Object(OI.jsx)('i', {
                                id: Pd.id,
                                onClick: function (Pf) {
                                  Pf.stopPropagation()
                                  Ob('endRace', { id: Pf.currentTarget.id })
                                },
                                className: 'fas fa-trash-alt fa-w-16 fa-fw fa-lg',
                              }),
                            }),
                          }),
                        }),
                      ],
                    }),
                    Object(OI.jsx)(Ad.a, {
                      in: PX,
                      timeout: 'auto',
                      unmountOnExit: true,
                      children:
                        Pd.players && Object.keys(Pd.players).length > 0
                          ? Object.values(Pd.players).map(function (Pf, PL) {
                              return Object(OI.jsx)(OD.a, {
                                sx: {
                                  width: '85%',
                                  marginLeft: '7.5%',
                                  marginBottom: '1.5%',
                                },
                                children: Object(OI.jsx)(Oo.a, {
                                  id: 'input-with-icon-textfield',
                                  variant: 'standard',
                                  value: Pf.name,
                                  InputProps: {
                                    readOnly: true,
                                    startAdornment: Object(OI.jsx)(Oa.a, {
                                      position: 'start',
                                      children: Object(OI.jsx)('i', {
                                        className: 'fas fa-user',
                                      }),
                                    }),
                                  },
                                }),
                              })
                            })
                          : Object(OI.jsx)(OI.Fragment, {}),
                    }),
                  ],
                },
                Pd.id
              ),
            })
          },
          Ar = function (Pd) {
            var PD = Object(OT.c)(OX),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(O4.useState)(false),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1]
            return Object(OI.jsx)(OI.Fragment, {
              children: Object(OI.jsxs)(
                'div',
                {
                  id: Pd.id,
                  className: 'component-paper cursor-pointer',
                  onClick: function () {
                    Pv(!PX)
                  },
                  onMouseEnter: function (Pf) {
                    PC(Pf.currentTarget.id)
                  },
                  onMouseLeave: function () {
                    PC('')
                  },
                  children: [
                    Object(OI.jsxs)('div', {
                      className: 'main-container',
                      children: [
                        Object(OI.jsxs)('div', {
                          className: 'details',
                          children: [
                            Object(OI.jsx)('div', {
                              className: 'title',
                              children: Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body2',
                                gutterBottom: true,
                                children: Pd.name,
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              className: 'description',
                              children: Object(OI.jsxs)('div', {
                                className: 'flex-row',
                                style: { justifyContent: 'space-between' },
                                children: [
                                  Object(OI.jsx)(OE.a, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'body2',
                                    gutterBottom: true,
                                    children: Pd.lapText,
                                  }),
                                  Object(OI.jsx)(OE.a, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'body2',
                                    gutterBottom: true,
                                    children: Pd.distText,
                                  }),
                                ],
                              }),
                            }),
                          ],
                        }),
                        Object(OI.jsxs)('div', {
                          className:
                            Pa.toString() === Pd.id.toString()
                              ? 'actions actions-show'
                              : 'actions',
                          children: [
                            Object(OI.jsx)(Op.a, {
                              title: 'Leave Race',
                              placement: 'top',
                              sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
                              arrow: true,
                              children: Object(OI.jsx)('div', {
                                style: {
                                  display: Pd.data.players[Pd.cid] ? '' : 'none',
                                },
                                children: Object(OI.jsx)('i', {
                                  id: Pd.id,
                                  onClick: function (Pf) {
                                    Pf.stopPropagation()
                                    Ob('leaveRace', { id: Pf.currentTarget.id })
                                  },
                                  className:
                                    'fas fa-user-times fa-w-16 fa-fw fa-lg',
                                }),
                              }),
                            }),
                            Object(OI.jsx)(Op.a, {
                              title: 'Start Race',
                              placement: 'top',
                              sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
                              arrow: true,
                              children: Object(OI.jsx)('div', {
                                style: {
                                  display:
                                    Pd.data.owner.toString() ===
                                      Pd.cid.toString() && Pd.data.players[Pd.cid]
                                      ? ''
                                      : 'none',
                                },
                                children: Object(OI.jsx)('i', {
                                  id: Pd.id,
                                  onClick: function () {
                                    return (
                                      (Pf = Pd.id),
                                      (PL = Pd.data.countdown),
                                      void Ob('startRace', {
                                        id: Pf,
                                        countdown: PL,
                                      })
                                    )
                                    var Pf, PL
                                  },
                                  className: 'fas fa-play fa-w-16 fa-fw fa-lg',
                                }),
                              }),
                            }),
                            Object(OI.jsx)(Op.a, {
                              title: 'Set GPS',
                              placement: 'top',
                              sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
                              arrow: true,
                              children: Object(OI.jsx)('div', {
                                children: Object(OI.jsx)('i', {
                                  id: Pd.id,
                                  onClick: function (Pf) {
                                    Pf.stopPropagation()
                                    Ob('locateRace', { id: Pf.currentTarget.id })
                                  },
                                  className:
                                    'fas fa-map-marker fa-w-16 fa-fw fa-lg',
                                }),
                              }),
                            }),
                            Object(OI.jsx)(Op.a, {
                              title: 'Preview Race',
                              placement: 'top',
                              sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
                              arrow: true,
                              children: Object(OI.jsx)('div', {
                                children: Object(OI.jsx)('i', {
                                  id: Pd.id,
                                  onClick: function (Pf) {
                                    Pf.stopPropagation()
                                    Ob('previewRace', { id: Pf.currentTarget.id })
                                  },
                                  className: 'fas fa-map fa-w-16 fa-fw fa-lg',
                                }),
                              }),
                            }),
                            Object(OI.jsx)(Op.a, {
                              title: 'Join Race',
                              placement: 'top',
                              sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
                              arrow: true,
                              children: Object(OI.jsx)('div', {
                                style: {
                                  display: Pd.data.players[Pd.cid] ? 'none' : '',
                                },
                                children: Object(OI.jsx)('i', {
                                  id: Pd.id,
                                  onClick: function (Pf) {
                                    Pf.stopPropagation()
                                    Ob('joinRace', { id: Pf.currentTarget.id })
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
                    Object(OI.jsx)(Ad.a, {
                      in: PX,
                      timeout: 'auto',
                      unmountOnExit: true,
                      children:
                        Pd.players && Object.keys(Pd.players).length > 0
                          ? Object.values(Pd.players).map(function (Pf, PL) {
                              return Object(OI.jsx)(OD.a, {
                                sx: {
                                  width: '85%',
                                  marginLeft: '7.5%',
                                  marginBottom: '1.5%',
                                },
                                children: Object(OI.jsx)(Oo.a, {
                                  id: 'input-with-icon-textfield',
                                  variant: 'standard',
                                  value: Pf.name,
                                  InputProps: {
                                    readOnly: true,
                                    startAdornment: Object(OI.jsx)(Oa.a, {
                                      position: 'start',
                                      children: Object(OI.jsx)('i', {
                                        className: 'fas fa-user',
                                      }),
                                    }),
                                  },
                                }),
                              })
                            })
                          : Object(OI.jsx)(OI.Fragment, {}),
                    }),
                  ],
                },
                Pd.id
              ),
            })
          },
          AY = function () {
            var Pi = Al(),
              PD = Object(OT.c)(OX),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = O5.a.useState(0),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1],
              Pf = Object(O4.useState)([]),
              PL = Object(O9.a)(Pf, 2),
              Py = (PL[0], PL[1], Object(O4.useState)([])),
              PU = Object(O9.a)(Py, 2),
              Pg = PU[0],
              Pc = PU[1],
              PJ = Object(O4.useState)([]),
              Pj = Object(O9.a)(PJ, 2),
              Pq = Pj[0],
              Pl = Pj[1],
              PN = Object(O4.useState)([]),
              Pr = Object(O9.a)(PN, 2),
              PY = Pr[0],
              Ps = Pr[1],
              Pu = Object(O4.useState)([]),
              Pm = Object(O9.a)(Pu, 2),
              PW = Pm[0],
              PR = Pm[1],
              Pw = Object(O4.useState)([]),
              PZ = Object(O9.a)(Pw, 2),
              PH = PZ[0],
              V0 = PZ[1],
              V1 = Object(O4.useState)(0),
              V2 = Object(O9.a)(V1, 2),
              V3 = V2[0],
              V4 = V2[1],
              V5 = Object(O4.useState)(false),
              V6 = Object(O9.a)(V5, 2),
              V7 = V6[0],
              V8 = V6[1],
              V9 = Object(O4.useState)(false),
              VO = Object(O9.a)(V9, 2),
              VA = VO[0],
              VP = VO[1],
              VV = Object(O4.useState)(false),
              Vb = Object(O9.a)(VV, 2),
              VB = Vb[0],
              Vh = Vb[1],
              Vk = Object(O4.useState)(false),
              VE = Object(O9.a)(Vk, 2),
              Vx = VE[0],
              Vz = VE[1],
              VQ = Object(O4.useState)(''),
              Vp = Object(O9.a)(VQ, 2),
              VM = Vp[0],
              VF = Vp[1],
              VI = Object(O4.useState)(''),
              VK = Object(O9.a)(VI, 2),
              VG = VK[0],
              Vn = VK[1],
              Vd = Object(O4.useState)(''),
              Vi = Object(O9.a)(Vd, 2),
              VD = Vi[0],
              Vo = Vi[1],
              Va = Object(O4.useState)(''),
              VC = Object(O9.a)(Va, 2),
              VS = VC[0],
              VT = VC[1],
              VX = Object(O4.useState)(''),
              Vv = Object(O9.a)(VX, 2),
              Vf = Vv[0],
              VL = Vv[1],
              Vy = Object(O4.useState)(''),
              VU = Object(O9.a)(Vy, 2),
              Vg = VU[0],
              Vc = VU[1],
              VJ = Object(O4.useState)(''),
              Vj = Object(O9.a)(VJ, 2),
              Vq = Vj[0],
              Vl = Vj[1],
              VN = Object(O4.useState)(false),
              Vr = Object(O9.a)(VN, 2),
              VY = Vr[0],
              Vs = Vr[1],
              Vu = Object(O4.useState)(false),
              Vm = Object(O9.a)(Vu, 2),
              VW = Vm[0],
              VR = Vm[1],
              Vw = Object(O4.useState)(false),
              Vt = Object(O9.a)(Vw, 2),
              VZ = Vt[0],
              VH = Vt[1]
            Object(O4.useEffect)(function () {
              Ob('getRacingData', {}).then(function (b7) {
                void 0 !== b7.races.pendingRaces && Pc(b7.races.pendingRaces)
                void 0 !== b7.races.activeRaces && Pl(b7.races.activeRaces)
                void 0 !== b7.races.finishedRaces && Ps(b7.races.finishedRaces)
                PR(b7.tracks)
                V0(b7.tracks)
                V4(b7.cid)
              })
            }, [])
            var b0 = function (b5) {
                PC(b5.currentTarget.id)
              },
              b1 = function () {
                PC('')
              },
              b2 = function (b5) {
                Ob('setTrackGps', { id: b5.currentTarget.id })
              },
              b3 = function (b5) {
                Vz(true)
                VT(b5.currentTarget.id)
              }
            return (
              OA('updateRacing', function (b5) {
                void 0 !== b5.pending && Pc(b5.pending)
                void 0 !== b5.active && Pl(b5.active)
                void 0 !== b5.completed && Ps(b5.completed)
              }),
              OA('closeApps', function () {
                Vz(false), V8(false), VP(false), Vh(false), VF(''), Vn(''), Vo('')
              }),
              Object(OI.jsxs)(OI.Fragment, {
                children: [
                  Object(OI.jsx)('div', {
                    className: Pi.racingCreateRaceModalContainer,
                    style: { display: Vx ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.racingCreateRaceModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: V7 ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: VA ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: V7 || VB ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Event Name',
                                    variant: 'standard',
                                    onChange: function (b5) {
                                      VF(b5.target.value)
                                    },
                                    value: VM,
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-user',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Laps',
                                    variant: 'standard',
                                    onChange: function (b5) {
                                      Vn(b5.target.value)
                                    },
                                    value: VG,
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-flag-checkered',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Amount',
                                    variant: 'standard',
                                    onChange: function (b5) {
                                      VL(b5.target.value)
                                    },
                                    value: Vf,
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-dollar-sign',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Countdown to Start',
                                    variant: 'standard',
                                    onChange: function (b5) {
                                      Vo(b5.target.value)
                                    },
                                    value: VD,
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-stopwatch-20',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'DNF Position',
                                    variant: 'standard',
                                    onChange: function (b5) {
                                      Vc(b5.target.value)
                                    },
                                    value: Vg,
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-sad-cry',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'DNF Countdown',
                                    variant: 'standard',
                                    onChange: function (b5) {
                                      Vl(b5.target.value)
                                    },
                                    value: Vq,
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-stopwatch-20',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsxs)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: [
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: VY,
                                        onChange: function (b5) {
                                          Vs(b5.target.checked)
                                        },
                                      }),
                                      label: 'Show Position',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: VW,
                                        onChange: function (b5) {
                                          VR(b5.target.checked)
                                        },
                                      }),
                                      label: 'Send Notification',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: VZ,
                                        onChange: function (b5) {
                                          VH(b5.target.checked)
                                        },
                                      }),
                                      label: 'Bubble Remover V2',
                                    }),
                                  ],
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Vz(false)
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      void 0 !== VM &&
                                        '' !== VM &&
                                        void 0 !== VG &&
                                          '' !== VG &&
                                          void 0 !== VD &&
                                          '' !== VD &&
                                          void 0 !== Vf &&
                                          '' !== Vf &&
                                          void 0 !== Vg &&
                                          '' !== Vg &&
                                          void 0 !== Vq &&
                                          '' !== Vq &&
                                          (V8(true),
                                          Vh(true),
                                          Ob('createRace', {
                                            id: VS,
                                            options: {
                                              eventName: VM,
                                              laps: VG,
                                              buyIn: Vf,
                                              countdown: VD,
                                              dnfPosition: Vg,
                                              dnfCountdown: Vq,
                                              showPosition: VY,
                                              sendNotification: VW,
                                              bubbleRemover: VZ,
                                            },
                                          }).then(function (b7) {
                                            VF('')
                                            Vn('')
                                            Vo('')
                                            VL('')
                                            Vc('')
                                            Vl('')
                                            Vs(false)
                                            VR(false)
                                            VH(false)
                                            V8(false)
                                            VP(true)
                                            setTimeout(function () {
                                              VP(false), Vz(false), Vh(false)
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
                  Object(OI.jsx)('div', {
                    className: Pi.racingOuterContainer,
                    style: { zIndex: 500 },
                    children: Object(OI.jsx)('div', {
                      className: Pi.racingInnerContainer,
                      children: Object(OI.jsxs)('div', {
                        className: 'racing-container',
                        children: [
                          Object(OI.jsx)('div', {
                            className: Pi.racingSearch,
                            children: Object(OI.jsxs)('div', {
                              className: Pi.racingSearchWrapper,
                              children: [
                                Object(OI.jsxs)(Av.a, {
                                  centered: true,
                                  style: { width: '100%' },
                                  value: PX,
                                  onChange: function (b5, b6) {
                                    Pv(b6)
                                  },
                                  'aria-label': 'icon tabs example',
                                  children: [
                                    Object(OI.jsx)(Af.a, {
                                      style: { minWidth: '25%' },
                                      icon: Object(OI.jsx)('i', {
                                        className: 'fas fa-flag-checkered fa-lg',
                                      }),
                                      'aria-label': 'races',
                                    }),
                                    Object(OI.jsx)(Af.a, {
                                      style: { minWidth: '25%' },
                                      icon: Object(OI.jsx)('i', {
                                        className: 'fas fa-map-marker fa-lg',
                                      }),
                                      'aria-label': 'maps',
                                    }),
                                    Object(OI.jsx)(Af.a, {
                                      style: { minWidth: '25%' },
                                      icon: Object(OI.jsx)('i', {
                                        className: 'fas fa-trophy fa-lg',
                                      }),
                                      'aria-label': 'leaderboard',
                                    }),
                                    Object(OI.jsx)(Af.a, {
                                      style: { minWidth: '25%' },
                                      icon: Object(OI.jsx)('i', {
                                        className: 'fas fa-medal fa-lg',
                                      }),
                                      'aria-label': 'highscores',
                                    }),
                                  ],
                                }),
                                Object(OI.jsx)('div', {
                                  className: 'input-wrapper',
                                  style: {
                                    display: 1 === PX ? 'flex' : 'none',
                                    justifyContent: 'center',
                                    marginTop: '5%',
                                  },
                                  children: Object(OI.jsx)(OD.a, {
                                    sx: { width: '86%' },
                                    children: Object(OI.jsx)(Oo.a, {
                                      id: 'input-with-icon-textfield',
                                      label: 'Search',
                                      onChange: function (b5) {
                                        return (function (b6) {
                                          if ('' !== b6) {
                                            var b8 = PW.filter(function (b9) {
                                              return b9.name
                                                .toLowerCase()
                                                .startsWith(b6.toLowerCase())
                                            })
                                            V0(b8)
                                          } else {
                                            V0(PW)
                                          }
                                        })(b5.target.value)
                                      },
                                      InputProps: {
                                        startAdornment: Object(OI.jsx)(Oa.a, {
                                          position: 'start',
                                          children: Object(OI.jsx)(Ab.a, {}),
                                        }),
                                      },
                                      variant: 'standard',
                                    }),
                                  }),
                                }),
                              ],
                            }),
                          }),
                          Object(OI.jsx)('div', {
                            className: Pi.racingIcon,
                            children: Object(OI.jsx)('div', {
                              className: Pi.racingIconWrapper,
                            }),
                          }),
                          Object(OI.jsxs)('div', {
                            className: Pi.racingWrapper,
                            style: { display: 0 === PX ? '' : 'none' },
                            children: [
                              Object(OI.jsxs)('div', {
                                className: Pi.racingPending,
                                style: {
                                  display: Pg && Pg.length > 0 ? '' : 'none',
                                },
                                children: [
                                  Object(OI.jsx)(OE.a, {
                                    style: {
                                      display: Pg && Pg.length > 0 ? '' : 'none',
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                      marginTop: '5px',
                                    },
                                    variant: 'body1',
                                    gutterBottom: true,
                                    children: 'Pending',
                                  }),
                                  Pg && Pg.length > 0
                                    ? Pg.map(function (b5, b6) {
                                        return Object(OI.jsx)(Ar, {
                                          id: b5.id,
                                          name: b5.eventName,
                                          lapText: 'Laps ('.concat(
                                            b5.laps,
                                            ') / Open'
                                          ),
                                          distText: ''.concat(
                                            Math.ceil(
                                              0.00062137 * b5.mapDistance
                                            ),
                                            'mi'
                                          ),
                                          cid: V3,
                                          players: b5.players,
                                          data: b5,
                                        })
                                      })
                                    : Object(OI.jsx)(OI.Fragment, {}),
                                ],
                              }),
                              Object(OI.jsxs)('div', {
                                className: Pi.racingActive,
                                style: {
                                  display: Pq && Pq.length > 0 ? '' : 'none',
                                },
                                children: [
                                  Object(OI.jsx)(OE.a, {
                                    style: {
                                      display: Pq && Pq.length > 0 ? '' : 'none',
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                      marginTop: '5px',
                                    },
                                    variant: 'body1',
                                    gutterBottom: true,
                                    children: 'Active',
                                  }),
                                  Pq && Pq.length > 0
                                    ? Pq.map(function (b5, b6) {
                                        return Object(OI.jsx)(AN, {
                                          id: b5.id,
                                          name: b5.eventName,
                                          lapText: 'Laps ('.concat(
                                            b5.laps,
                                            ') / Closed'
                                          ),
                                          distText: ''.concat(
                                            Math.ceil(
                                              0.00062137 * b5.mapDistance
                                            ),
                                            'mi'
                                          ),
                                          cid: V3,
                                          players: b5.players,
                                          data: b5,
                                          type: 'active',
                                        })
                                      })
                                    : Object(OI.jsx)(OI.Fragment, {}),
                                ],
                              }),
                              Object(OI.jsxs)('div', {
                                className: Pi.racingCompleted,
                                style: {
                                  display: PY && PY.length > 0 ? '' : 'none',
                                },
                                children: [
                                  Object(OI.jsx)(OE.a, {
                                    style: {
                                      display: PY && PY.length > 0 ? '' : 'none',
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                      marginTop: '5px',
                                    },
                                    variant: 'body1',
                                    gutterBottom: true,
                                    children: 'Completed',
                                  }),
                                  PY && PY.length > 0
                                    ? PY.map(function (b5, b6) {
                                        return Object(OI.jsx)(AN, {
                                          id: b5.id,
                                          name: b5.eventName,
                                          lapText: 'Laps ('.concat(
                                            b5.laps,
                                            ') / Closed'
                                          ),
                                          distText: ''.concat(
                                            Math.ceil(
                                              0.00062137 * b5.mapDistance
                                            ),
                                            'mi'
                                          ),
                                          cid: V3,
                                          players: b5.players,
                                          data: b5,
                                          type: 'completed',
                                        })
                                      })
                                    : Object(OI.jsx)(OI.Fragment, {}),
                                ],
                              }),
                            ],
                          }),
                          Object(OI.jsx)('div', {
                            className: Pi.racingTracks,
                            style: {
                              display: 1 === PX ? '' : 'none',
                              marginTop: '25%',
                              height: '72%',
                              maxHeight: '72%',
                            },
                            children:
                              PH && PH.length > 0
                                ? PH.map(function (b5, b6) {
                                    return Object(OI.jsx)(
                                      'div',
                                      {
                                        id: b5.id,
                                        className:
                                          'component-paper cursor-pointer',
                                        style: { paddingBottom: '1.2%' },
                                        onMouseEnter: b0,
                                        onMouseLeave: b1,
                                        children: Object(OI.jsxs)('div', {
                                          className: 'main-container',
                                          children: [
                                            Object(OI.jsxs)('div', {
                                              className: 'details',
                                              children: [
                                                Object(OI.jsx)('div', {
                                                  className: 'title',
                                                  children: Object(OI.jsx)(OE.a, {
                                                    style: {
                                                      color: '#fff',
                                                      wordBreak: 'break-word',
                                                    },
                                                    variant: 'body2',
                                                    gutterBottom: true,
                                                    children: b5.name,
                                                  }),
                                                }),
                                                Object(OI.jsx)('div', {
                                                  className: 'description',
                                                  children: Object(OI.jsx)(
                                                    'div',
                                                    {
                                                      className: 'flex-row',
                                                      children: Object(OI.jsx)(
                                                        OE.a,
                                                        {
                                                          style: {
                                                            color: '#fff',
                                                            wordBreak:
                                                              'break-word',
                                                          },
                                                          variant: 'body2',
                                                          gutterBottom: true,
                                                          children: b5.type,
                                                        }
                                                      ),
                                                    }
                                                  ),
                                                }),
                                              ],
                                            }),
                                            Object(OI.jsxs)('div', {
                                              className:
                                                Pa.toString() === b5.id.toString()
                                                  ? 'actions actions-show'
                                                  : 'actions',
                                              children: [
                                                Object(OI.jsx)(Op.a, {
                                                  title: 'Set GPS',
                                                  placement: 'top',
                                                  sx: {
                                                    backgroundColor:
                                                      'rgba(97, 97, 97, 0.9)',
                                                  },
                                                  arrow: true,
                                                  children: Object(OI.jsx)(
                                                    'div',
                                                    {
                                                      children: Object(OI.jsx)(
                                                        'i',
                                                        {
                                                          id: b5.id,
                                                          onClick: b2,
                                                          className:
                                                            'fas fa-map-marker fa-w-16 fa-fw fa-lg',
                                                        }
                                                      ),
                                                    }
                                                  ),
                                                }),
                                                Object(OI.jsx)(Op.a, {
                                                  title: 'Create Race',
                                                  placement: 'top',
                                                  sx: {
                                                    backgroundColor:
                                                      'rgba(97, 97, 97, 0.9)',
                                                  },
                                                  arrow: true,
                                                  children: Object(OI.jsx)(
                                                    'div',
                                                    {
                                                      children: Object(OI.jsx)(
                                                        'i',
                                                        {
                                                          id: b5.id,
                                                          onClick: b3,
                                                          className:
                                                            'fas fa-flag-checkered fa-w-16 fa-fw fa-lg',
                                                        }
                                                      ),
                                                    }
                                                  ),
                                                }),
                                              ],
                                            }),
                                            Object(OI.jsx)('div', {
                                              className: 'image',
                                              children: Object(OI.jsxs)(OE.a, {
                                                style: {
                                                  color: '#fff',
                                                  wordBreak: 'break-word',
                                                },
                                                variant: 'body2',
                                                gutterBottom: true,
                                                children: [
                                                  Math.ceil(
                                                    0.00062137 * b5.distance
                                                  ),
                                                  '1mi',
                                                ],
                                              }),
                                            }),
                                          ],
                                        }),
                                      },
                                      b5.id
                                    )
                                  })
                                : Object(OI.jsx)(OI.Fragment, {}),
                          }),
                        ],
                      }),
                    }),
                  }),
                ],
              })
            )
          },
          As = O2(269),
          Au = O2(258),
          Am = O2(270),
          AW = O2(272),
          AR = O2(243),
          Aw = O2(271),
          AZ = Object(A3.a)({
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
          AH = function () {
            var Pi = AZ(),
              PD = Object(OT.c)(OX),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(O4.useState)([]),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1],
              Pf = Object(O4.useState)(false),
              PL = Object(O9.a)(Pf, 2),
              Py = PL[0],
              PU = PL[1],
              Pg = Object(O4.useState)(false),
              Pc = Object(O9.a)(Pg, 2),
              PJ = Pc[0],
              Pj = Pc[1],
              Pq = Object(O4.useState)(false),
              Pl = Object(O9.a)(Pq, 2),
              PN = Pl[0],
              Pr = Pl[1],
              PY = Object(O4.useState)(false),
              Ps = Object(O9.a)(PY, 2),
              Pu = Ps[0],
              Pm = Ps[1],
              PW = Object(O4.useState)([]),
              PR = Object(O9.a)(PW, 2),
              Pw = PR[0],
              PZ = PR[1],
              PH = Object(O4.useState)([]),
              V0 = Object(O9.a)(PH, 2),
              V1 = V0[0],
              V2 = V0[1],
              V3 = Object(O4.useState)([]),
              V4 = Object(O9.a)(V3, 2),
              V5 = V4[0],
              V6 = V4[1],
              V7 = Object(O4.useState)([]),
              V8 = Object(O9.a)(V7, 2),
              V9 = V8[0],
              VO = V8[1],
              VA = Object(O4.useState)([]),
              VP = Object(O9.a)(VA, 2),
              VV = VP[0],
              Vb = VP[1],
              VB = Object(O4.useState)(0),
              Vh = Object(O9.a)(VB, 2),
              Vk = Vh[0],
              VE = Vh[1],
              Vx = Object(O4.useState)(''),
              Vz = Object(O9.a)(Vx, 2),
              VQ = Vz[0],
              Vp = Vz[1],
              VM = Object(O4.useState)(''),
              VF = Object(O9.a)(VM, 2),
              VI = VF[0],
              VK = VF[1],
              VG = Object(O4.useState)(''),
              Vn = Object(O9.a)(VG, 2),
              Vd = Vn[0],
              Vi = Vn[1]
            Object(O4.useEffect)(function () {
              Ob('getJobsData', {}).then(function (VC) {
                if (VC.signedin) {
                  if (VC.ingroup) {
                    var VS = VC.groupdata
                    VS.inActivity
                      ? (PU(true),
                        Pj(true),
                        Pm(true),
                        VE(VS.id),
                        Vp(VS.leader),
                        VK(VC.src),
                        Vb(VS.tasks),
                        Vi(VC.jobname))
                      : (PU(true),
                        Pj(true),
                        Pm(false),
                        VE(VS.id),
                        Vp(VS.leader),
                        VK(VC.src),
                        VO(VS.members),
                        true === VS.ready ? Pr(true) : Pr(false),
                        Vb([]),
                        Vi(''))
                  } else {
                    PU(true)
                    V2(VC.groups.idle)
                    V6(VC.groups.busy)
                  }
                } else {
                  PU(false)
                  Pr(false)
                  Pj(false)
                  Pm(false)
                  Pv(VC.jobs)
                  PZ(VC.jobs)
                }
              })
            }, [])
            var VD = function (Va) {
                PC(Va.currentTarget.id)
              },
              Vo = function () {
                PC('')
              }
            return (
              OA('updateGroups', function () {
                Ob('getJobsData', {}).then(function (VC) {
                  if (VC.signedin) {
                    if (VC.ingroup) {
                      var VS = VC.groupdata
                      VS.inActivity
                        ? (PU(true),
                          Pj(true),
                          Pm(true),
                          VE(VS.id),
                          Vp(VS.leader),
                          VK(VC.src),
                          Vb(VS.tasks),
                          Vi(VC.jobname))
                        : (PU(true),
                          Pj(true),
                          Pm(false),
                          VE(VS.id),
                          Vp(VS.leader),
                          VK(VC.src),
                          VO(VS.members),
                          true === VS.ready ? Pr(true) : Pr(false),
                          Vb([]),
                          Vi(''))
                    } else {
                      PU(true)
                      Pj(false)
                      Pr(false)
                      Pm(false)
                      V2(VC.groups.idle)
                      V6(VC.groups.busy)
                    }
                  } else {
                    PU(false)
                    Pj(false)
                    Pr(false)
                    Pm(false)
                    Pv(VC.jobs)
                    PZ(VC.jobs)
                  }
                })
              }),
              Object(OI.jsx)(OI.Fragment, {
                children: Object(OI.jsx)('div', {
                  className: Pi.jobsOuterContainer,
                  style: { zIndex: 500 },
                  children: Object(OI.jsx)('div', {
                    className: Pi.jobsInnerContainer,
                    children: Object(OI.jsxs)('div', {
                      className: 'jobs-container',
                      children: [
                        Object(OI.jsx)('div', {
                          className: Pi.jobsSearch,
                          style: {
                            height: Py ? '20%' : '64px',
                            display: Pu ? 'none' : '',
                          },
                          children: Object(OI.jsxs)('div', {
                            className: Pi.jobsSearchWrapper,
                            style: { width: Py ? 'auto' : '100%' },
                            children: [
                              Object(OI.jsx)(OE.a, {
                                style: {
                                  display: Py && !PJ ? '' : 'none',
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body1',
                                gutterBottom: true,
                                children:
                                  'Join an idle group or browse groups currently busy',
                              }),
                              Object(OI.jsxs)(OZ.a, {
                                direction: 'row',
                                spacing: 4.6,
                                style: { display: Py && !PJ ? '' : 'none' },
                                children: [
                                  Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Ob('createGroup')
                                    },
                                    size: 'small',
                                    color: 'success',
                                    variant: 'contained',
                                    children: 'Create Group',
                                  }),
                                  Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Ob('checkOut')
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Check Out',
                                  }),
                                ],
                              }),
                              Object(OI.jsx)(AQ.a, {
                                variant: 'middle',
                                sx: {
                                  display: Py && !PJ ? '' : 'none',
                                  borderColor: '#aeb0b2',
                                  marginTop: '5%',
                                  marginLeft: '0%',
                                  marginRight: '0%',
                                },
                              }),
                              Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                style: { display: Py ? 'none' : '' },
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Search',
                                    onChange: function (Va) {
                                      return (function (VS) {
                                        if ('' !== VS) {
                                          var VT = PX.filter(function (VX) {
                                            return (
                                              VX.id
                                                .toLowerCase()
                                                .startsWith(VS.toLowerCase()) ||
                                              VX.name
                                                .toLowerCase()
                                                .startsWith(VS.toLowerCase())
                                            )
                                          })
                                          PZ(VT)
                                        } else {
                                          PZ(PX)
                                        }
                                      })(Va.target.value)
                                    },
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)(Ab.a, {}),
                                      }),
                                    },
                                    variant: 'standard',
                                  }),
                                }),
                              }),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: Pi.jobsIcon,
                          children: Object(OI.jsx)('div', {
                            className: Pi.jobsIconWrapper,
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: Pi.jobsJobs,
                          style: { display: Py ? 'none' : '' },
                          children:
                            Pw && Pw.length > 0
                              ? Pw.map(function (Va) {
                                  return Object(OI.jsx)('div', {
                                    id: Va.id,
                                    className: 'component-paper cursor-pointer',
                                    onMouseEnter: VD,
                                    onMouseLeave: Vo,
                                    children: Object(OI.jsxs)('div', {
                                      className: 'main-container',
                                      children: [
                                        Object(OI.jsx)('div', {
                                          className: 'image',
                                          children: Object(OI.jsx)('i', {
                                            className: 'fas '.concat(
                                              Va.icon,
                                              ' fa-w-16 fa-fw fa-3x'
                                            ),
                                          }),
                                        }),
                                        Object(OI.jsxs)('div', {
                                          className: 'details',
                                          children: [
                                            Object(OI.jsx)('div', {
                                              className: 'title',
                                              children: Object(OI.jsx)(OE.a, {
                                                style: {
                                                  color: '#fff',
                                                  wordBreak: 'break-word',
                                                },
                                                variant: 'body2',
                                                gutterBottom: true,
                                                children: Va.name,
                                              }),
                                            }),
                                            Object(OI.jsx)('div', {
                                              className: 'description',
                                              children: Object(OI.jsxs)('div', {
                                                className: 'flex-row',
                                                children: [
                                                  Object(OI.jsx)('i', {
                                                    className:
                                                      'fas fa-dollar-sign fa-w-16 fa-fw fa-1x',
                                                    style: { color: '#476a49' },
                                                  }),
                                                  Object(OI.jsxs)('div', {
                                                    className: 'flex-row',
                                                    children: [
                                                      Object(OI.jsx)('i', {
                                                        className:
                                                          'fas fa-dollar-sign fa-w-16 fa-fw fa-1x',
                                                        style: {
                                                          color: '#476a49',
                                                        },
                                                      }),
                                                      Object(OI.jsxs)('div', {
                                                        className: 'flex-row',
                                                        children: [
                                                          Object(OI.jsx)('i', {
                                                            className:
                                                              'fas fa-dollar-sign fa-w-16 fa-fw fa-1x',
                                                            style: {
                                                              color: '#476a49',
                                                            },
                                                          }),
                                                          Object(OI.jsxs)('div', {
                                                            className: 'flex-row',
                                                            children: [
                                                              Object(OI.jsx)(
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
                                                              Object(OI.jsx)(
                                                                'div',
                                                                {
                                                                  className:
                                                                    'flex-row',
                                                                  children:
                                                                    Object(
                                                                      OI.jsx
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
                                        Object(OI.jsx)('div', {
                                          className:
                                            Pa.toString() === Va.id.toString()
                                              ? 'actions actions-show'
                                              : 'actions',
                                          children: Object(OI.jsx)(Op.a, {
                                            title: 'Set GPS',
                                            placement: 'top',
                                            sx: {
                                              backgroundColor:
                                                'rgba(97, 97, 97, 0.9)',
                                            },
                                            arrow: true,
                                            children: Object(OI.jsx)('div', {
                                              children: Object(OI.jsx)('i', {
                                                id: Va.id,
                                                onClick: function (VS) {
                                                  return (function (VT) {
                                                    Ob('setJobsGps', {
                                                      id: VT.currentTarget.id,
                                                    })
                                                  })(VS)
                                                },
                                                className:
                                                  'fas fa-map-marked fa-w-16 fa-fw fa-lg',
                                              }),
                                            }),
                                          }),
                                        }),
                                        Object(OI.jsxs)('div', {
                                          className: 'image',
                                          children: [
                                            Object(OI.jsxs)(OE.a, {
                                              style: {
                                                color: '#fff',
                                                wordBreak: 'break-word',
                                              },
                                              variant: 'body2',
                                              gutterBottom: true,
                                              children: [
                                                Va.limit,
                                                Object(OI.jsx)('i', {
                                                  className:
                                                    'fas fa-people-carry fa-w-16 fa-fw fa-sm',
                                                  style: { marginLeft: '5px' },
                                                }),
                                              ],
                                            }),
                                            Object(OI.jsx)('div', {
                                              className: 'image',
                                              children: Object(OI.jsxs)(OE.a, {
                                                style: {
                                                  color: '#fff',
                                                  wordBreak: 'break-word',
                                                },
                                                variant: 'body2',
                                                gutterBottom: true,
                                                children: [
                                                  Va.groups.length,
                                                  Object(OI.jsx)('i', {
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
                              : Object(OI.jsxs)('div', {
                                  className: 'flex-centered',
                                  style: {
                                    padding: '32px',
                                    flexDirection: 'column',
                                    textAlign: 'center',
                                  },
                                  children: [
                                    Object(OI.jsx)('i', {
                                      className:
                                        'fas fa-frown fa-w-16 fa-fw fa-3x',
                                      style: {
                                        color: '#fff',
                                        marginBottom: '32px',
                                      },
                                    }),
                                    Object(OI.jsx)(OE.a, {
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
                        Object(OI.jsxs)('div', {
                          className: Pi.jobsGroupsWrapper,
                          children: [
                            Object(OI.jsxs)('div', {
                              className: Pi.jobsGroupsIdle,
                              style: {
                                height: 'fit-content',
                                display: Py && !PJ && V1.length > 0 ? '' : 'none',
                              },
                              children: [
                                Object(OI.jsx)(OE.a, {
                                  style: {
                                    color: '#fff',
                                    wordBreak: 'break-word',
                                    marginTop: '5px',
                                  },
                                  variant: 'body1',
                                  gutterBottom: true,
                                  children: 'Idle',
                                }),
                                V1 && V1.length > 0
                                  ? V1.map(function (Va) {
                                      return Object(OI.jsx)('div', {
                                        className:
                                          'component-paper cursor-pointer',
                                        children: Object(OI.jsxs)('div', {
                                          className: 'main-container',
                                          children: [
                                            Object(OI.jsx)('div', {
                                              className: 'image',
                                              children: Object(OI.jsx)('i', {
                                                className:
                                                  'fas fa-users fa-w-16 fa-fw fa-3x',
                                              }),
                                            }),
                                            Object(OI.jsxs)('div', {
                                              className: 'details',
                                              children: [
                                                Object(OI.jsx)('div', {
                                                  className: 'title',
                                                  children: Object(OI.jsx)(OE.a, {
                                                    style: {
                                                      color: '#fff',
                                                      wordBreak: 'break-word',
                                                    },
                                                    variant: 'body2',
                                                    gutterBottom: true,
                                                    children: Va.name,
                                                  }),
                                                }),
                                                Object(OI.jsx)('div', {
                                                  className: 'description',
                                                  children: Object(OI.jsx)(
                                                    'div',
                                                    {
                                                      className: 'flex-row',
                                                      children: Object(OI.jsx)(
                                                        Op.a,
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
                                                            OI.jsx
                                                          )('i', {
                                                            onClick: function () {
                                                              Ob('joinGroup', {
                                                                id: Va.id,
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
                                            Object(OI.jsxs)('div', {
                                              className: 'details',
                                              children: [
                                                Object(OI.jsx)('div', {
                                                  className: 'title',
                                                }),
                                                Object(OI.jsx)('div', {
                                                  className: 'description',
                                                  children: Object(OI.jsxs)(
                                                    'div',
                                                    {
                                                      className: 'flex-row',
                                                      style: {
                                                        fontFamily:
                                                          'Roboto, Helvetica, Arial, sans-serif',
                                                      },
                                                      children: [
                                                        Object(OI.jsx)('ul', {
                                                          className: 'fa-ul',
                                                          children: Object(
                                                            OI.jsxs
                                                          )('li', {
                                                            style: {
                                                              fontSize: '15px',
                                                            },
                                                            children: [
                                                              Object(OI.jsx)(
                                                                'span',
                                                                {
                                                                  className:
                                                                    'fa-li',
                                                                  children:
                                                                    Object(
                                                                      OI.jsx
                                                                    )('i', {
                                                                      className:
                                                                        'fas fa-people-carry fa-w-16 fa-fw fa-sm',
                                                                    }),
                                                                }
                                                              ),
                                                              Va.limit,
                                                            ],
                                                          }),
                                                        }),
                                                        Object(OI.jsx)('ul', {
                                                          className: 'fa-ul',
                                                          children: Object(
                                                            OI.jsxs
                                                          )('li', {
                                                            style: {
                                                              fontSize: '15px',
                                                            },
                                                            children: [
                                                              Object(OI.jsx)(
                                                                'span',
                                                                {
                                                                  className:
                                                                    'fa-li',
                                                                  children:
                                                                    Object(
                                                                      OI.jsx
                                                                    )('i', {
                                                                      className:
                                                                        'fas fa-user fa-w-16 fa-fw fa-sm',
                                                                    }),
                                                                }
                                                              ),
                                                              Va.members.length,
                                                            ],
                                                          }),
                                                        }),
                                                      ],
                                                    }
                                                  ),
                                                }),
                                              ],
                                            }),
                                            Object(OI.jsx)('div', {
                                              className: 'actions',
                                            }),
                                          ],
                                        }),
                                      })
                                    })
                                  : Object(OI.jsx)(OI.Fragment, {}),
                              ],
                            }),
                            Object(OI.jsxs)('div', {
                              className: Pi.jobsGroupsBusy,
                              style: {
                                display: Py && !PJ && V5.length > 0 ? '' : 'none',
                              },
                              children: [
                                Object(OI.jsx)(OE.a, {
                                  style: {
                                    color: '#fff',
                                    wordBreak: 'break-word',
                                    marginTop: '5px',
                                  },
                                  variant: 'body1',
                                  gutterBottom: true,
                                  children: 'Busy',
                                }),
                                V5 && V5.length > 0
                                  ? V5.map(function (Va) {
                                      return Object(OI.jsx)('div', {
                                        className:
                                          'component-paper cursor-pointer',
                                        children: Object(OI.jsxs)('div', {
                                          className: 'main-container',
                                          children: [
                                            Object(OI.jsx)('div', {
                                              className: 'image',
                                              children: Object(OI.jsx)('i', {
                                                className:
                                                  'fas fa-users-slash fa-w-16 fa-fw fa-3x',
                                              }),
                                            }),
                                            Object(OI.jsxs)('div', {
                                              className: 'details',
                                              children: [
                                                Object(OI.jsx)('div', {
                                                  className: 'title',
                                                  children: Object(OI.jsx)(OE.a, {
                                                    style: {
                                                      color: '#fff',
                                                      wordBreak: 'break-word',
                                                    },
                                                    variant: 'body2',
                                                    gutterBottom: true,
                                                    children: Va.name,
                                                  }),
                                                }),
                                                Object(OI.jsx)('div', {
                                                  className: 'description',
                                                  children: Object(OI.jsx)(
                                                    'div',
                                                    { className: 'flex-row' }
                                                  ),
                                                }),
                                              ],
                                            }),
                                            Object(OI.jsxs)('div', {
                                              className: 'details',
                                              children: [
                                                Object(OI.jsx)('div', {
                                                  className: 'title',
                                                }),
                                                Object(OI.jsx)('div', {
                                                  className: 'description',
                                                  children: Object(OI.jsxs)(
                                                    'div',
                                                    {
                                                      className: 'flex-row',
                                                      style: {
                                                        fontFamily:
                                                          'Roboto, Helvetica, Arial, sans-serif',
                                                      },
                                                      children: [
                                                        Object(OI.jsx)('ul', {
                                                          className: 'fa-ul',
                                                          children: Object(
                                                            OI.jsxs
                                                          )('li', {
                                                            style: {
                                                              fontSize: '15px',
                                                            },
                                                            children: [
                                                              Object(OI.jsx)(
                                                                'span',
                                                                {
                                                                  className:
                                                                    'fa-li',
                                                                  children:
                                                                    Object(
                                                                      OI.jsx
                                                                    )('i', {
                                                                      className:
                                                                        'fas fa-people-carry fa-w-16 fa-fw fa-sm',
                                                                    }),
                                                                }
                                                              ),
                                                              Va.limit,
                                                            ],
                                                          }),
                                                        }),
                                                        Object(OI.jsx)('ul', {
                                                          className: 'fa-ul',
                                                          children: Object(
                                                            OI.jsxs
                                                          )('li', {
                                                            style: {
                                                              fontSize: '15px',
                                                            },
                                                            children: [
                                                              Object(OI.jsx)(
                                                                'span',
                                                                {
                                                                  className:
                                                                    'fa-li',
                                                                  children:
                                                                    Object(
                                                                      OI.jsx
                                                                    )('i', {
                                                                      className:
                                                                        'fas fa-user fa-w-16 fa-fw fa-sm',
                                                                    }),
                                                                }
                                                              ),
                                                              Va.members.length,
                                                            ],
                                                          }),
                                                        }),
                                                      ],
                                                    }
                                                  ),
                                                }),
                                              ],
                                            }),
                                            Object(OI.jsx)('div', {
                                              className: 'actions',
                                            }),
                                          ],
                                        }),
                                      })
                                    })
                                  : Object(OI.jsx)(OI.Fragment, {}),
                              ],
                            }),
                          ],
                        }),
                        Object(OI.jsxs)('div', {
                          className: Pi.jobsInGroupWrapper,
                          style: {
                            display: Py && PJ && !Pu ? '' : 'none',
                            top: PN ? '3vh' : '2vh',
                          },
                          children: [
                            Object(OI.jsx)('div', {
                              className: Pi.waitingForActivity,
                              style: {
                                display: Py && PJ && PN && !Pu ? '' : 'none',
                              },
                              children: Object(OI.jsxs)('div', {
                                className: 'component-ripple-effect',
                                children: [
                                  Object(OI.jsxs)('div', {
                                    className: 'lds-ripple',
                                    style: { marginLeft: '20%' },
                                    children: [
                                      Object(OI.jsx)('div', {}),
                                      Object(OI.jsx)('div', {}),
                                    ],
                                  }),
                                  Object(OI.jsx)(OE.a, {
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
                            Object(OI.jsxs)('div', {
                              className: Pi.jobsInGroupLeader,
                              style: {
                                height: 'fit-content',
                                display: Py && PJ && !Pu ? '' : 'none',
                              },
                              children: [
                                Object(OI.jsx)(OE.a, {
                                  style: {
                                    color: '#fff',
                                    wordBreak: 'break-word',
                                    marginTop: '5px',
                                  },
                                  variant: 'body1',
                                  gutterBottom: true,
                                  children: 'Members',
                                }),
                                V9 && V9.length > 0
                                  ? V9.map(function (Va) {
                                      return Object(OI.jsx)('div', {
                                        id: Va.src,
                                        className:
                                          'component-paper cursor-pointer',
                                        onMouseEnter: VD,
                                        onMouseLeave: Vo,
                                        children: Object(OI.jsxs)('div', {
                                          className: 'main-container',
                                          children: [
                                            Object(OI.jsx)('div', {
                                              className: 'image',
                                              children: Object(OI.jsx)('i', {
                                                className: 'fas '.concat(
                                                  Number(Va.src) === Number(VQ)
                                                    ? 'fa-user-graduate'
                                                    : 'fa-user',
                                                  ' fa-w-16 fa-fw fa-3x'
                                                ),
                                              }),
                                            }),
                                            Object(OI.jsxs)('div', {
                                              className: 'details',
                                              children: [
                                                Object(OI.jsx)('div', {
                                                  className: 'title',
                                                  children: Object(OI.jsx)(OE.a, {
                                                    style: {
                                                      color: '#fff',
                                                      wordBreak: 'break-word',
                                                    },
                                                    variant: 'body2',
                                                    gutterBottom: true,
                                                    children: Va.name,
                                                  }),
                                                }),
                                                Object(OI.jsx)('div', {
                                                  className: 'description',
                                                  children: Object(OI.jsx)(
                                                    'div',
                                                    {
                                                      className: 'flex-row',
                                                      children: Object(OI.jsx)(
                                                        OE.a,
                                                        {
                                                          style: {
                                                            color: '#fff',
                                                            wordBreak:
                                                              'break-word',
                                                          },
                                                          variant: 'body2',
                                                          gutterBottom: true,
                                                          children:
                                                            Number(Va.src) ===
                                                            Number(VQ)
                                                              ? 'Leader'
                                                              : 'Member',
                                                        }
                                                      ),
                                                    }
                                                  ),
                                                }),
                                              ],
                                            }),
                                            Object(OI.jsx)('div', {
                                              className:
                                                Pa.toString() ===
                                                  Va.src.toString() &&
                                                Number(VQ) === Number(VI) &&
                                                Number(VQ) !== Number(Va.src)
                                                  ? 'actions actions-show'
                                                  : 'actions',
                                              children: Object(OI.jsx)(Op.a, {
                                                title: 'Kick Member',
                                                placement: 'top',
                                                sx: {
                                                  backgroundColor:
                                                    'rgba(97, 97, 97, 0.9)',
                                                },
                                                arrow: true,
                                                children: Object(OI.jsx)('div', {
                                                  children: Object(OI.jsx)('i', {
                                                    onClick: function () {
                                                      return (
                                                        (VS = Va.src),
                                                        void Ob('kickGroup', {
                                                          id: Vk,
                                                          src: VS,
                                                        })
                                                      )
                                                      var VS
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
                                  : Object(OI.jsx)(OI.Fragment, {}),
                              ],
                            }),
                          ],
                        }),
                        Object(OI.jsxs)('div', {
                          className: Pi.jobsInGroupButtons,
                          style: { display: PJ && !Pu ? '' : 'none' },
                          children: [
                            Object(OI.jsxs)(OZ.a, {
                              direction: 'column',
                              spacing: 2,
                              style: {
                                display: Number(VQ) === Number(VI) ? '' : 'none',
                                whiteSpace: 'nowrap',
                              },
                              children: [
                                Object(OI.jsx)(OC.a, {
                                  onClick: function () {
                                    Ob('readyGroup', { id: Vk })
                                  },
                                  size: 'small',
                                  color: 'success',
                                  variant: 'contained',
                                  children: PN
                                    ? 'Unready for Jobs'
                                    : 'Ready for Jobs',
                                }),
                                Object(OI.jsx)(OC.a, {
                                  onClick: function () {
                                    Ob('disbandGroup', { id: Vk })
                                  },
                                  size: 'small',
                                  color: 'success',
                                  variant: 'contained',
                                  children: 'Disband Group',
                                }),
                              ],
                            }),
                            Object(OI.jsx)(OZ.a, {
                              direction: 'column',
                              spacing: 2,
                              style: {
                                display: Number(VQ) !== Number(VI) ? '' : 'none',
                                marginTop: '42%',
                              },
                              children: Object(OI.jsx)(OC.a, {
                                onClick: function () {
                                  Ob('leaveGroup', { id: Vk })
                                },
                                size: 'small',
                                color: 'success',
                                variant: 'contained',
                                children: 'Leave Group',
                              }),
                            }),
                          ],
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'activity-container',
                          style: { display: Py && PJ && Pu ? '' : 'none' },
                          children: [
                            Object(OI.jsxs)('div', {
                              className: 'activity-title',
                              style: {
                                width: '95%',
                                marginLeft: '2.5%',
                              },
                              children: [
                                Object(OI.jsx)(OE.a, {
                                  style: {
                                    color: '#fff',
                                    wordBreak: 'break-word',
                                  },
                                  variant: 'body2',
                                  gutterBottom: true,
                                  children: Vd,
                                }),
                                Object(OI.jsx)('div', {
                                  className: 'timer',
                                  children: Object(OI.jsx)(OE.a, {
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
                            Object(OI.jsx)('div', {
                              className: 'task-list',
                              children: Object(OI.jsx)('div', {
                                className: 'activity-task-paper-wrapper',
                                style: { marginLeft: '2.5%' },
                                children:
                                  VV && VV.length > 0
                                    ? VV.map(function (Va) {
                                        return Object(OI.jsx)('div', {
                                          className: 'activity-task-wrapper',
                                          children: Object(OI.jsx)(As.a, {
                                            children: Object(OI.jsxs)(Au.a, {
                                              children: [
                                                Object(OI.jsxs)(Am.a, {
                                                  children: [
                                                    Object(OI.jsx)(Aw.a, {
                                                      color: 'secondary',
                                                    }),
                                                    Object(OI.jsx)(AW.a, {
                                                      sx: {
                                                        backgroundColor:
                                                          Va.completed
                                                            ? 'rgb(66, 76, 171)'
                                                            : 'rgb(189, 189, 189)',
                                                      },
                                                    }),
                                                  ],
                                                }),
                                                Object(OI.jsx)(AR.a, {
                                                  children: Object(OI.jsx)(
                                                    'div',
                                                    {
                                                      className:
                                                        'component-paper cursor-pointer',
                                                      style: { width: '94.6%' },
                                                      children: Object(OI.jsxs)(
                                                        'div',
                                                        {
                                                          className:
                                                            'main-container',
                                                          children: [
                                                            Object(OI.jsxs)(
                                                              'div',
                                                              {
                                                                className:
                                                                  'details',
                                                                children: [
                                                                  Object(OI.jsx)(
                                                                    'div',
                                                                    {
                                                                      className:
                                                                        'description',
                                                                      children:
                                                                        Object(
                                                                          OI.jsx
                                                                        )('div', {
                                                                          className:
                                                                            'flex-row',
                                                                          children:
                                                                            Object(
                                                                              OI.jsx
                                                                            )(
                                                                              OE.a,
                                                                              {
                                                                                style:
                                                                                  {
                                                                                    color:
                                                                                      '#fff',
                                                                                    wordBreak:
                                                                                      'break-word',
                                                                                    textDecoration:
                                                                                      Va.completed
                                                                                        ? 'line-through'
                                                                                        : 'none',
                                                                                  },
                                                                                variant:
                                                                                  'body2',
                                                                                gutterBottom:
                                                                                  true,
                                                                                children:
                                                                                  Va.task,
                                                                              }
                                                                            ),
                                                                        }),
                                                                    }
                                                                  ),
                                                                  Object(OI.jsx)(
                                                                    'div',
                                                                    {
                                                                      className:
                                                                        'description',
                                                                      children:
                                                                        Object(
                                                                          OI.jsx
                                                                        )('div', {
                                                                          className:
                                                                            'flex-row',
                                                                          style: {
                                                                            justifyContent:
                                                                              'flex-end',
                                                                          },
                                                                          children:
                                                                            Object(
                                                                              OI.jsx
                                                                            )(
                                                                              OE.a,
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
                                                                                  Va.completed
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
                                                            Object(OI.jsx)(
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
                                    : Object(OI.jsx)(OI.Fragment, {}),
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
          P0 = Object(A3.a)({
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
          P1 = function () {
            var Pi = P0(),
              PD = Object(OT.c)(OX),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(O4.useState)([]),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1],
              Pf = Object(O4.useState)([]),
              PL = Object(O9.a)(Pf, 2),
              Py = PL[0],
              PU = PL[1],
              Pg = Object(O4.useState)(0),
              Pc = Object(O9.a)(Pg, 2),
              PJ = Pc[0],
              Pj = Pc[1],
              Pq = Object(O4.useState)(false),
              Pl = Object(O9.a)(Pq, 2),
              PN = Pl[0],
              Pr = Pl[1],
              PY = Object(O4.useState)(false),
              Ps = Object(O9.a)(PY, 2),
              Pu = Ps[0],
              Pm = Ps[1],
              PW = Object(O4.useState)(false),
              PR = Object(O9.a)(PW, 2),
              Pw = PR[0],
              PZ = PR[1],
              PH = Object(O4.useState)(false),
              V0 = Object(O9.a)(PH, 2),
              V1 = V0[0],
              V2 = V0[1],
              V3 = Object(O4.useState)(false),
              V4 = Object(O9.a)(V3, 2),
              V5 = (V4[0], V4[1]),
              V6 = Object(O4.useState)(''),
              V7 = Object(O9.a)(V6, 2),
              V8 = (V7[0], V7[1])
            Object(O4.useEffect)(function () {
              Ob('getDarkmarketData', {}).then(function (Vb) {
                Pv(Vb)
                PU(Vb)
              })
            }, [])
            var V9 = function (VP) {
                PC(VP.currentTarget.id)
              },
              VO = function () {
                PC('')
              },
              VA = function (VP) {
                Pj(VP.currentTarget.id)
                Pr(true)
              }
            return (
              OA('closeApps', function () {
                Pr(false)
                Pm(false)
                PZ(false)
                V2(false)
                V5(false)
                V8('')
              }),
              Object(OI.jsxs)(OI.Fragment, {
                children: [
                  Object(OI.jsx)('div', {
                    className: Pi.darkmarketConfirmModalContainer,
                    style: { display: PN ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.darkmarketConfirmModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Pu ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Pw ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: V1 ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              style: { justifyContent: 'center' },
                              children: Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body1',
                                gutterBottom: true,
                                children: 'Confirm purchase',
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Pr(false)
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Pm(true)
                                      V2(true)
                                      Ob('purchaseProduct', { id: PJ }).then(
                                        function (VV) {
                                          true === VV.success
                                            ? setTimeout(function () {
                                                Pm(false)
                                                PZ(true)
                                                setTimeout(function () {
                                                  PZ(false)
                                                  Pr(false)
                                                  V2(false)
                                                }, 1500)
                                              }, 500)
                                            : (Pm(false),
                                              V2(false),
                                              V8(VV.message),
                                              V5(true))
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
                  Object(OI.jsx)(AB, {
                    emptyMessage: 0 === Py.length,
                    primaryActions: [],
                    search: {
                      filter: ['product_name', 'product_price'],
                      list: PX,
                      onChange: PU,
                    },
                    children:
                      Py && Py.length > 0
                        ? Py.map(function (VP) {
                            return Object(OI.jsx)(
                              'div',
                              {
                                id: VP.id,
                                className: 'component-paper cursor-pointer',
                                onMouseEnter: V9,
                                onMouseLeave: VO,
                                children: Object(OI.jsxs)('div', {
                                  className: 'main-container',
                                  children: [
                                    Object(OI.jsx)('div', {
                                      className: 'image',
                                      children: Object(OI.jsx)('i', {
                                        className: 'fas '.concat(
                                          VP.product_icon,
                                          ' fa-w-16 fa-fw fa-3x'
                                        ),
                                      }),
                                    }),
                                    Object(OI.jsxs)('div', {
                                      className: 'details',
                                      children: [
                                        Object(OI.jsx)('div', {
                                          className: 'title',
                                          children: Object(OI.jsx)(OE.a, {
                                            style: {
                                              color: '#fff',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                            children: VP.product_name,
                                          }),
                                        }),
                                        Object(OI.jsx)('div', {
                                          className: 'description',
                                          children: Object(OI.jsx)('div', {
                                            className: 'flex-row',
                                            children: Object(OI.jsxs)(OE.a, {
                                              style: {
                                                color: '#fff',
                                                wordBreak: 'break-word',
                                              },
                                              variant: 'body2',
                                              gutterBottom: true,
                                              children: [
                                                VP.product_price,
                                                ' ',
                                                1 === VP.cryptoid
                                                  ? 'SHUNGITE'
                                                  : 'GUINEA',
                                              ],
                                            }),
                                          }),
                                        }),
                                      ],
                                    }),
                                    Object(OI.jsx)('div', {
                                      className:
                                        Pa.toString() === VP.id.toString()
                                          ? 'actions actions-show'
                                          : 'actions',
                                      children: Object(OI.jsx)(Op.a, {
                                        title: 'Buy Product',
                                        placement: 'top',
                                        sx: {
                                          backgroundColor:
                                            'rgba(97, 97, 97, 0.9)',
                                        },
                                        arrow: true,
                                        children: Object(OI.jsx)('div', {
                                          children: Object(OI.jsx)('i', {
                                            onClick: VA,
                                            id: VP.id,
                                            className:
                                              'fas fa-hand-holding-usd fa-w-16 fa-fw fa-lg',
                                          }),
                                        }),
                                      }),
                                    }),
                                  ],
                                }),
                              },
                              VP.id
                            )
                          })
                        : Object(OI.jsx)(OI.Fragment, {}),
                  }),
                ],
              })
            )
          },
          P2 = function () {
            var Pd = Object(O4.useState)([]),
              Pi = Object(O9.a)(Pd, 2),
              PD = Pi[0],
              Po = Pi[1],
              Pa = Object(O4.useState)([]),
              PC = Object(O9.a)(Pa, 2),
              PS = PC[0],
              PT = PC[1]
            return (
              Object(O4.useEffect)(function () {
                Ob('getEmploymentData', {}).then(function (Pv) {
                  Po(Pv)
                  PT(Pv)
                })
              }, []),
              OA('closeApps', function () {}),
              Object(OI.jsx)(OI.Fragment, {
                children: Object(OI.jsx)(AB, {
                  emptyMessage: 0 === PS.length,
                  primaryActions: [],
                  search: {
                    filter: ['businessname'],
                    list: PD,
                    onChange: PT,
                  },
                  children:
                    PS && PS.length > 0
                      ? PS.map(function (PX, Pv) {
                          return Object(OI.jsx)(Oi.b, {
                            to: '/employees/'.concat(PX.businessid),
                            style: {
                              color: '#fff',
                              textDecoration: 'none',
                            },
                            children: Object(OI.jsx)(
                              'div',
                              {
                                id: PX.id,
                                className: 'component-paper cursor-pointer',
                                children: Object(OI.jsxs)('div', {
                                  className: 'main-container',
                                  children: [
                                    Object(OI.jsx)('div', {
                                      className: 'image',
                                      children: Object(OI.jsx)('i', {
                                        className:
                                          'fas fa-business-time fa-w-16 fa-fw fa-3x',
                                      }),
                                    }),
                                    Object(OI.jsxs)('div', {
                                      className: 'details',
                                      children: [
                                        Object(OI.jsx)('div', {
                                          className: 'title',
                                          children: Object(OI.jsx)(OE.a, {
                                            style: {
                                              color: '#fff',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                            children: PX.businessname,
                                          }),
                                        }),
                                        Object(OI.jsx)('div', {
                                          className: 'description',
                                          children: Object(OI.jsx)('div', {
                                            className: 'flex-row',
                                            children: Object(OI.jsx)(OE.a, {
                                              style: {
                                                color: '#fff',
                                                wordBreak: 'break-word',
                                              },
                                              variant: 'body2',
                                              gutterBottom: true,
                                              children: PX.businessrole,
                                            }),
                                          }),
                                        }),
                                      ],
                                    }),
                                    Object(OI.jsx)('div', {
                                      className: 'actions',
                                    }),
                                  ],
                                }),
                              },
                              PX.id
                            ),
                          })
                        })
                      : Object(OI.jsx)(OI.Fragment, {}),
                }),
              })
            )
          },
          P3 = O2(136),
          P4 = Object(A3.a)({
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
          P5 = function () {
            var Pi = P4(),
              PD = Object(OT.c)(OX),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(O4.useState)([]),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1],
              Pf = Object(O4.useState)([]),
              PL = Object(O9.a)(Pf, 2),
              Py = PL[0],
              PU = PL[1],
              Pg = Object(O4.useState)({
                roleManage: false,
                roleCreate: false,
                canHire: false,
                canFire: false,
                canCharge: false,
              }),
              Pc = Object(O9.a)(Pg, 2),
              PJ = Pc[0],
              Pj = Pc[1],
              Pq = Object(O4.useState)([]),
              Pl = Object(O9.a)(Pq, 2),
              PN = Pl[0],
              Pr = Pl[1],
              PY = Object(O4.useState)(false),
              Ps = Object(O9.a)(PY, 2),
              Pu = Ps[0],
              Pm = Ps[1],
              PW = Object(O4.useState)(false),
              PR = Object(O9.a)(PW, 2),
              Pw = PR[0],
              PZ = PR[1],
              PH = Object(O4.useState)(false),
              V0 = Object(O9.a)(PH, 2),
              V1 = V0[0],
              V2 = V0[1],
              V3 = Object(O4.useState)(false),
              V4 = Object(O9.a)(V3, 2),
              V5 = V4[0],
              V6 = V4[1],
              V7 = Object(O4.useState)(false),
              V8 = Object(O9.a)(V7, 2),
              V9 = V8[0],
              VO = V8[1],
              VA = Object(O4.useState)(false),
              VP = Object(O9.a)(VA, 2),
              VV = VP[0],
              Vb = VP[1],
              VB = Object(O4.useState)(false),
              Vh = Object(O9.a)(VB, 2),
              Vk = Vh[0],
              VE = Vh[1],
              Vx = Object(O4.useState)(false),
              Vz = Object(O9.a)(Vx, 2),
              VQ = Vz[0],
              Vp = Vz[1],
              VM = Object(O4.useState)(false),
              VF = Object(O9.a)(VM, 2),
              VI = VF[0],
              VK = VF[1],
              VG = Object(O4.useState)(false),
              Vn = Object(O9.a)(VG, 2),
              Vd = Vn[0],
              Vi = Vn[1],
              VD = Object(O4.useState)(false),
              Vo = Object(O9.a)(VD, 2),
              Va = Vo[0],
              VC = Vo[1],
              VS = Object(O4.useState)(false),
              VT = Object(O9.a)(VS, 2),
              VX = VT[0],
              Vv = VT[1],
              Vf = Object(O4.useState)(false),
              VL = Object(O9.a)(Vf, 2),
              Vy = VL[0],
              VU = VL[1],
              Vg = Object(O4.useState)(false),
              Vc = Object(O9.a)(Vg, 2),
              VJ = Vc[0],
              Vj = Vc[1],
              Vq = Object(O4.useState)(false),
              Vl = Object(O9.a)(Vq, 2),
              VN = Vl[0],
              Vr = Vl[1],
              VY = Object(O4.useState)(false),
              Vs = Object(O9.a)(VY, 2),
              Vu = Vs[0],
              Vm = Vs[1],
              VW = Object(O4.useState)(false),
              VR = Object(O9.a)(VW, 2),
              Vw = VR[0],
              VZ = VR[1],
              VH = Object(O4.useState)(false),
              b0 = Object(O9.a)(VH, 2),
              b1 = b0[0],
              b2 = b0[1],
              b3 = Object(O4.useState)(false),
              b4 = Object(O9.a)(b3, 2),
              b5 = b4[0],
              b6 = b4[1],
              b7 = Object(O4.useState)(''),
              b8 = Object(O9.a)(b7, 2),
              b9 = b8[0],
              bO = b8[1],
              bA = Object(O4.useState)(''),
              bP = Object(O9.a)(bA, 2),
              bV = bP[0],
              bb = bP[1],
              bB = Object(O4.useState)(''),
              bh = Object(O9.a)(bB, 2),
              bk = bh[0],
              bE = bh[1],
              bx = Object(O4.useState)(0),
              bz = Object(O9.a)(bx, 2),
              bQ = bz[0],
              bp = bz[1],
              bM = Object(O4.useState)(0),
              bF = Object(O9.a)(bM, 2),
              bI = bF[0],
              bK = bF[1],
              bG = Object(O4.useState)(''),
              bn = Object(O9.a)(bG, 2),
              bd = bn[0],
              bi = bn[1],
              bD = Object(O4.useState)(''),
              bo = Object(O9.a)(bD, 2),
              bC = bo[0],
              bS = bo[1],
              bT = Object(O4.useState)(''),
              bX = Object(O9.a)(bT, 2),
              bv = (bX[0], bX[1]),
              bf = Object(O4.useState)(''),
              bL = Object(O9.a)(bf, 2),
              by = bL[0],
              bU = bL[1],
              bg = Object(O4.useState)(0),
              bc = Object(O9.a)(bg, 2),
              bJ = bc[0],
              bj = bc[1],
              bq = Object(Ok.g)().businessId,
              bl = O5.a.useState(null),
              bN = Object(O9.a)(bl, 2),
              br = bN[0],
              bY = bN[1],
              bs = Boolean(br)
            Object(O4.useEffect)(
              function () {
                Ob('getEmployeesData', { id: bq }).then(function (BA) {
                  Pv(BA.employees)
                  PU(BA.employees)
                  Pr(BA.roles)
                  bj(BA.cid)
                  Pj(BA.permission)
                })
              },
              [bq]
            )
            var bu = function (BO) {
                VE(BO.target.checked)
              },
              bm = function (BO) {
                Vp(BO.target.checked)
              },
              bW = function (BO) {
                VK(BO.target.checked)
              },
              bR = function (BO) {
                Vi(BO.target.checked)
              },
              bw = function (BO) {
                VC(BO.target.checked)
              },
              bZ = function (BO) {
                Vv(BO.target.checked)
              },
              bH = function (BO) {
                VU(BO.target.checked)
              },
              B0 = function (BO) {
                Vj(BO.target.checked)
              },
              B1 = function (BO) {
                Vr(BO.target.checked)
              },
              B2 = function (BO) {
                Vm(BO.target.checked)
              },
              B3 = function (BO) {
                bO(BO.currentTarget.id)
                Pm(true)
              },
              B4 = function (BO) {
                Ob('removeEmployee', {
                  id: BO.currentTarget.id,
                  businessid: bq,
                }).then(function (BP) {
                  Pv(BP.employees)
                  PU(BP.employees)
                  Pr(BP.roles)
                  bj(BP.cid)
                })
              },
              B5 = function (BO) {
                bb(BO.currentTarget.id)
              },
              B6 = function (BO) {
                PC(BO.currentTarget.id)
              },
              B7 = function (BO) {
                bU(BO.target.value)
              },
              B8 = function () {
                PC('')
              },
              B9 = Object(Ok.f)()
            return (
              OA('closeApps', function () {
                VZ(false)
                b2(false)
                b6(false)
                Pm(false)
                PZ(false)
                V2(false)
                V6(false)
                VO(false)
                Vb(false)
                VE(false)
                Vp(false)
                VK(false)
                Vi(false)
                VC(false)
                Vv(false)
                VU(false)
                Vj(false)
                Vr(false)
                Vm(false)
                bY(null)
                bO('')
                bb('')
                bU('')
                bE('')
                bp(0)
                bK(0)
                bi('')
                bS('')
                bv('Owner')
              }),
              Object(OI.jsxs)(OI.Fragment, {
                children: [
                  Object(OI.jsx)('div', {
                    className: Pi.employeeEditEmployeeModalContainer,
                    style: { display: Pu ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.employeeEditEmployeeModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Vw ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: b1 ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: Vw || b5 ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'State ID',
                                    variant: 'standard',
                                    value: b9,
                                    InputProps: {
                                      readOnly: true,
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-id-card',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Role',
                                    variant: 'standard',
                                    defaultValue: bV,
                                    onChange: B7,
                                    select: true,
                                    children: PN.map(function (BO, BA) {
                                      BO.value
                                      var BP = BO.label
                                      return Object(OI.jsx)(
                                        AC.a,
                                        {
                                          value: BP,
                                          children: BP,
                                        },
                                        BP
                                      )
                                    }),
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Pm(false)
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      VZ(true)
                                      b6(true)
                                      Ob('editEmployee', {
                                        id: b9,
                                        businessid: bq,
                                        role: by,
                                      }).then(function (BA) {
                                        Pv(BA.employees)
                                        PU(BA.employees)
                                        Pr(BA.roles)
                                        bj(BA.cid)
                                        VZ(false)
                                        b2(true)
                                        setTimeout(function () {
                                          b2(false)
                                          Pm(false)
                                          b6(false)
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
                  Object(OI.jsx)('div', {
                    className: Pi.employeeHireEmployeeModalContainer,
                    style: { display: Pw ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.employeeHireEmployeeModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Vw ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: b1 ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: Vw || b5 ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    className: Pi.input,
                                    id: 'input-with-icon-textfield',
                                    type: 'number',
                                    label: 'State ID',
                                    variant: 'standard',
                                    onChange: function (BO) {
                                      bE(BO.target.value)
                                    },
                                    value: bk,
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-id-card',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Role',
                                    variant: 'standard',
                                    onChange: B7,
                                    select: true,
                                    children: PN.map(function (BO, BA) {
                                      BO.value
                                      var BP = BO.label
                                      return Object(OI.jsx)(
                                        AC.a,
                                        {
                                          value: BP,
                                          children: BP,
                                        },
                                        BP
                                      )
                                    }),
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      PZ(false)
                                      bE('')
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      VZ(true),
                                        b6(true),
                                        Ob('hireEmployee', {
                                          id: bk,
                                          businessid: bq,
                                          role: by,
                                        }).then(function (BP) {
                                          Pv(BP.employees)
                                          PU(BP.employees)
                                          Pr(BP.roles)
                                          bj(BP.cid)
                                          VZ(false)
                                          b2(true)
                                          setTimeout(function () {
                                            b2(false)
                                            PZ(false)
                                            b6(false)
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
                  Object(OI.jsx)('div', {
                    className: Pi.employeeChargeCustomerModalContainer,
                    style: { display: V1 ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.employeeChargeCustomerModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Vw ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: b1 ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: Vw || b5 ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    className: Pi.input,
                                    id: 'input-with-icon-textfield',
                                    type: 'number',
                                    label: 'State ID',
                                    variant: 'standard',
                                    onChange: function (BO) {
                                      bp(BO.target.value)
                                    },
                                    value: bQ,
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-id-card',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    className: Pi.input,
                                    id: 'input-with-icon-textfield',
                                    type: 'number',
                                    label: 'Amount',
                                    variant: 'standard',
                                    onChange: function (BO) {
                                      bK(BO.target.value)
                                    },
                                    value: bI,
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-dollar-sign',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)(OD.a, {
                                fullWidth: true,
                                sx: { width: '100%' },
                                children: Object(OI.jsx)(Oo.a, {
                                  multiline: true,
                                  rows: 2,
                                  id: 'input-with-icon-textfield',
                                  label: 'Comment',
                                  variant: 'standard',
                                  onChange: function (BO) {
                                    bi(BO.target.value)
                                  },
                                  value: bd,
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      V2(false)
                                      bp(0)
                                      bK(0)
                                      bi('')
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      VZ(true)
                                      b6(true)
                                      Ob('chargeCustomer', {
                                        id: bQ,
                                        businessid: bq,
                                        amount: bI,
                                        comment: bd,
                                      }).then(function (BP) {
                                        VZ(false)
                                        b2(true)
                                        bp(0)
                                        bK(0)
                                        bi('')
                                        setTimeout(function () {
                                          b2(false)
                                          V2(false)
                                          b6(false)
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
                  Object(OI.jsx)('div', {
                    className: Pi.employeeDeleteRoleModalContainer,
                    style: { display: V5 ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.employeeDeleteRoleModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Vw ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: b1 ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: Vw || b5 ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Role',
                                    variant: 'standard',
                                    onChange: B7,
                                    select: true,
                                    children: PN.map(function (BO, BA) {
                                      BO.value
                                      var BP = BO.label
                                      return Object(OI.jsx)(
                                        AC.a,
                                        {
                                          value: BP,
                                          children: BP,
                                        },
                                        BP
                                      )
                                    }),
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      V6(false)
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      VZ(true),
                                        b6(true),
                                        Ob('deleteRole', {
                                          businessid: bq,
                                          role: by,
                                        }).then(function (BP) {
                                          Pv(BP.employees)
                                          PU(BP.employees)
                                          Pr(BP.roles)
                                          bj(BP.cid)
                                          VZ(false)
                                          b2(true)
                                          setTimeout(function () {
                                            b2(false)
                                            V6(false)
                                            b6(false)
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
                  Object(OI.jsx)('div', {
                    className: Pi.employeeCreateRoleModalContainer,
                    style: { display: V9 ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.employeeCreateRoleModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Vw ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: b1 ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: Vw || b5 ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Role Name',
                                    variant: 'standard',
                                    onChange: function (BO) {
                                      bS(BO.target.value)
                                    },
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-tag',
                                        }),
                                      }),
                                    },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsxs)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: [
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: Vk,
                                        onChange: bu,
                                      }),
                                      label: 'Hire',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: VQ,
                                        onChange: bm,
                                      }),
                                      label: 'Fire',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: VI,
                                        onChange: bW,
                                      }),
                                      label: 'Change Role',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: Vd,
                                        onChange: bR,
                                      }),
                                      label: 'Pay Employee',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: Va,
                                        onChange: bw,
                                      }),
                                      label: 'Pay External',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: VX,
                                        onChange: bZ,
                                      }),
                                      label: 'Charge External',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: Vy,
                                        onChange: bH,
                                      }),
                                      label: 'Property Keys',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: VJ,
                                        onChange: B0,
                                      }),
                                      label: 'Stash Access',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: VN,
                                        onChange: B1,
                                      }),
                                      label: 'Craft Access',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: Vu,
                                        onChange: B2,
                                      }),
                                      label: 'Bank Access',
                                    }),
                                  ],
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              style: { marginTop: '0px' },
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      VO(false)
                                      bS('')
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      VZ(true),
                                        b6(true),
                                        Ob('createRole', {
                                          businessid: bq,
                                          role: bC,
                                          permissions: {
                                            hire: Vk,
                                            fire: VQ,
                                            changeRole: VI,
                                            payEmployee: Vd,
                                            payExternal: Va,
                                            chargeExternal: VX,
                                            propertyKeys: Vy,
                                            stash: VJ,
                                            craft: VN,
                                            bank: Vu,
                                          },
                                        }).then(function (BA) {
                                          Pv(BA.employees),
                                            PU(BA.employees),
                                            Pr(BA.roles),
                                            bj(BA.cid),
                                            VE(false),
                                            Vp(false),
                                            VK(false),
                                            Vi(false),
                                            VC(false),
                                            Vv(false),
                                            VU(false),
                                            Vj(false),
                                            Vr(false),
                                            Vm(false),
                                            VZ(false),
                                            b2(true),
                                            setTimeout(function () {
                                              b2(false)
                                              VO(false)
                                              bS('')
                                              b6(false)
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
                  Object(OI.jsx)('div', {
                    className: Pi.employeeEditRoleModalContainer,
                    style: { display: VV ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.employeeEditRoleModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Vw ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: b1 ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: Vw || b5 ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Role',
                                    variant: 'standard',
                                    onChange: function (BO) {
                                      bU(BO.target.value)
                                      Ob('getRolePermission', {
                                        businessid: bq,
                                        role: BO.target.value,
                                      }).then(function (BP) {
                                        VE(BP.canHire)
                                        Vp(BP.canFire)
                                        VK(BP.roleManage)
                                        VU(BP.hasKeys)
                                        Vv(BP.canCharge)
                                        Vj(BP.hasStash)
                                        Vr(BP.hasCraft)
                                        Vm(BP.hasBank)
                                      })
                                    },
                                    select: true,
                                    children: PN.map(function (BO, BA) {
                                      BO.value
                                      var BP = BO.label
                                      return Object(OI.jsx)(
                                        AC.a,
                                        {
                                          value: BP,
                                          children: BP,
                                        },
                                        BP
                                      )
                                    }),
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsxs)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: [
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: Vk,
                                        onChange: bu,
                                      }),
                                      label: 'Hire',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: VQ,
                                        onChange: bm,
                                      }),
                                      label: 'Fire',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: VI,
                                        onChange: bW,
                                      }),
                                      label: 'Change Role',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: Vd,
                                        onChange: bR,
                                      }),
                                      label: 'Pay Employee',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: Va,
                                        onChange: bw,
                                      }),
                                      label: 'Pay External',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: VX,
                                        onChange: bZ,
                                      }),
                                      label: 'Charge External',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: Vy,
                                        onChange: bH,
                                      }),
                                      label: 'Property Keys',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: VJ,
                                        onChange: B0,
                                      }),
                                      label: 'Stash Access',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: VN,
                                        onChange: B1,
                                      }),
                                      label: 'Craft Access',
                                    }),
                                    Object(OI.jsx)(Aj.a, {
                                      style: { color: '#fff' },
                                      control: Object(OI.jsx)(Aq.a, {
                                        color: 'warning',
                                        checked: Vu,
                                        onChange: B2,
                                      }),
                                      label: 'Bank Access',
                                    }),
                                  ],
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              style: { marginTop: '0px' },
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Vb(false), bv('Owner')
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      VZ(true)
                                      b6(true)
                                      Ob('editRole', {
                                        businessid: bq,
                                        role: by,
                                        permissions: {
                                          hire: Vk,
                                          fire: VQ,
                                          changeRole: VI,
                                          payEmployee: Vd,
                                          payExternal: Va,
                                          chargeExternal: VX,
                                          propertyKeys: Vy,
                                          stash: VJ,
                                          craft: VN,
                                          bank: Vu,
                                        },
                                      }).then(function (BA) {
                                        Pv(BA.employees)
                                        PU(BA.employees)
                                        Pr(BA.roles)
                                        bj(BA.cid)
                                        bv('Owner')
                                        VZ(false)
                                        b2(true)
                                        setTimeout(function () {
                                          b2(false)
                                          Vb(false)
                                          b6(false)
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
                  Object(OI.jsx)('div', {
                    className: Pi.employeesOuterContainer,
                    style: { zIndex: 500 },
                    children: Object(OI.jsx)('div', {
                      className: Pi.employeesInnerContainer,
                      children: Object(OI.jsxs)('div', {
                        className: 'employees-container',
                        children: [
                          Object(OI.jsxs)('div', {
                            className: Pi.employeesSearch,
                            children: [
                              Object(OI.jsx)(Op.a, {
                                title: 'Go Back',
                                placement: 'right',
                                sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
                                arrow: true,
                                children: Object(OI.jsx)('div', {
                                  style: {
                                    color: '#fff',
                                    width: '40px',
                                    display: 'flex',
                                    alignItems: 'center',
                                  },
                                  children: Object(OI.jsx)('i', {
                                    onClick: function () {
                                      B9.push('/employment')
                                    },
                                    className:
                                      'fas fa-chevron-left fa-w-10 fa-fw fa-lg',
                                  }),
                                }),
                              }),
                              Object(OI.jsx)('div', {
                                className: Pi.employeesSearchWrapper,
                                children: Object(OI.jsx)('div', {
                                  className: 'input-wrapper',
                                  children: Object(OI.jsx)(OD.a, {
                                    fullWidth: true,
                                    sx: { width: '100%' },
                                    children: Object(OI.jsx)(Oo.a, {
                                      id: 'input-with-icon-textfield',
                                      label: 'Search',
                                      onChange: function (BO) {
                                        return (function (BP) {
                                          if ('' !== BP) {
                                            var Bb = PX.filter(function (Bh) {
                                              return Bh.name
                                                .toLowerCase()
                                                .startsWith(BP.toLowerCase())
                                            })
                                            PU(Bb)
                                          } else {
                                            PU(PX)
                                          }
                                        })(BO.target.value)
                                      },
                                      InputProps: {
                                        startAdornment: Object(OI.jsx)(Oa.a, {
                                          position: 'start',
                                          children: Object(OI.jsx)(Ab.a, {}),
                                        }),
                                      },
                                      variant: 'standard',
                                    }),
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(OI.jsx)('div', {
                            className: Pi.employeesIcon,
                            children: Object(OI.jsxs)('div', {
                              className: Pi.employeesIconWrapper,
                              children: [
                                Object(OI.jsx)('i', {
                                  onClick: function (BO) {
                                    bY(BO.currentTarget)
                                  },
                                  style: {
                                    display:
                                      PJ.roleCreate ||
                                      PJ.roleManage ||
                                      PJ.canHire ||
                                      PJ.canCharge
                                        ? ''
                                        : 'none',
                                    fontSize: '1.2em',
                                  },
                                  className:
                                    'fas fa-ellipsis-v fa-w-16 fa-fw fa-lg',
                                }),
                                Object(OI.jsxs)(P3.a, {
                                  id: 'demo-positioned-menu',
                                  'aria-labelledby': 'demo-positioned-button',
                                  anchorEl: br,
                                  open: bs,
                                  onClose: function () {
                                    bY(null)
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
                                    Object(OI.jsxs)(AC.a, {
                                      style: {
                                        display: PJ.canHire ? '' : 'none',
                                      },
                                      onClick: function () {
                                        bY(null)
                                        PZ(true)
                                      },
                                      children: [
                                        Object(OI.jsx)('i', {
                                          className: 'fas fa-user-plus',
                                          style: {
                                            display: PJ.canHire ? '' : 'none',
                                            marginRight: '5%',
                                          },
                                        }),
                                        ' Hire',
                                      ],
                                    }),
                                    Object(OI.jsxs)(AC.a, {
                                      style: {
                                        display: PJ.canCharge ? '' : 'none',
                                      },
                                      onClick: function () {
                                        bY(null)
                                        V2(true)
                                      },
                                      children: [
                                        Object(OI.jsx)('i', {
                                          className: 'fas fa-credit-card',
                                          style: {
                                            display: PJ.canCharge ? '' : 'none',
                                            marginRight: '5%',
                                          },
                                        }),
                                        ' Charge Customer',
                                      ],
                                    }),
                                    Object(OI.jsxs)(AC.a, {
                                      style: {
                                        display: PJ.roleCreate ? '' : 'none',
                                      },
                                      onClick: function () {
                                        bY(null)
                                        VO(true)
                                      },
                                      children: [
                                        Object(OI.jsx)('i', {
                                          className: 'fas fa-user-tag',
                                          style: {
                                            display: PJ.roleCreate ? '' : 'none',
                                            marginRight: '5%',
                                          },
                                        }),
                                        ' Create Role',
                                      ],
                                    }),
                                    Object(OI.jsxs)(AC.a, {
                                      style: {
                                        display: PJ.roleManage ? '' : 'none',
                                      },
                                      onClick: function () {
                                        bv('Owner')
                                        bY(null)
                                        Vb(true)
                                      },
                                      children: [
                                        Object(OI.jsx)('i', {
                                          className: 'fas fa-user-tag',
                                          style: {
                                            display: PJ.roleManage ? '' : 'none',
                                            marginRight: '5%',
                                          },
                                        }),
                                        ' Edit Role',
                                      ],
                                    }),
                                    Object(OI.jsxs)(AC.a, {
                                      style: {
                                        display: PJ.roleManage ? '' : 'none',
                                      },
                                      onClick: function () {
                                        bY(null)
                                        V6(true)
                                      },
                                      children: [
                                        Object(OI.jsx)('i', {
                                          className: 'fas fa-user-tag',
                                          style: {
                                            display: PJ.roleManage ? '' : 'none',
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
                          Object(OI.jsx)('div', {
                            className: Pi.employeesEmployees,
                            children:
                              Py && Py.length > 0
                                ? Py.sort(function (BO, BA) {
                                    return Number(BA.rank) - Number(BO.rank)
                                  }).map(function (BO, BA) {
                                    return Object(OI.jsx)(
                                      'div',
                                      {
                                        id: BO.id,
                                        className:
                                          'component-paper cursor-pointer',
                                        onMouseEnter: B6,
                                        onMouseLeave: B8,
                                        children: Object(OI.jsxs)('div', {
                                          className: 'main-container',
                                          children: [
                                            Object(OI.jsx)('div', {
                                              className: 'image',
                                              children: Object(OI.jsx)('i', {
                                                className: 'fas '.concat(
                                                  BO.icon,
                                                  ' fa-w-16 fa-fw fa-3x'
                                                ),
                                              }),
                                            }),
                                            Object(OI.jsxs)('div', {
                                              className: 'details',
                                              children: [
                                                Object(OI.jsx)('div', {
                                                  className: 'title',
                                                  children: Object(OI.jsx)(OE.a, {
                                                    style: {
                                                      color: '#fff',
                                                      wordBreak: 'break-word',
                                                    },
                                                    variant: 'body2',
                                                    gutterBottom: true,
                                                    children: BO.name,
                                                  }),
                                                }),
                                                Object(OI.jsx)('div', {
                                                  className: 'description',
                                                  children: Object(OI.jsx)(
                                                    'div',
                                                    {
                                                      className: 'flex-row',
                                                      children: Object(OI.jsx)(
                                                        OE.a,
                                                        {
                                                          style: {
                                                            color: '#fff',
                                                            wordBreak:
                                                              'break-word',
                                                          },
                                                          variant: 'body2',
                                                          gutterBottom: true,
                                                          children:
                                                            BO.businessrole,
                                                        }
                                                      ),
                                                    }
                                                  ),
                                                }),
                                              ],
                                            }),
                                            Object(OI.jsxs)('div', {
                                              className:
                                                Pa.toString() ===
                                                  BO.id.toString() &&
                                                BO.cid.toString() !==
                                                  bJ.toString()
                                                  ? 'actions actions-show'
                                                  : 'actions',
                                              children: [
                                                Object(OI.jsx)(Op.a, {
                                                  title: 'Edit Role',
                                                  placement: 'top',
                                                  sx: {
                                                    display: PJ.roleManage
                                                      ? ''
                                                      : 'none',
                                                    backgroundColor:
                                                      'rgba(97, 97, 97, 0.9)',
                                                  },
                                                  arrow: true,
                                                  children: Object(OI.jsx)(
                                                    'div',
                                                    {
                                                      style: {
                                                        display: PJ.roleManage
                                                          ? ''
                                                          : 'none',
                                                      },
                                                      onClick: B5,
                                                      id: BO.businessrole,
                                                      children: Object(OI.jsx)(
                                                        'i',
                                                        {
                                                          onClick: B3,
                                                          id: BO.cid,
                                                          className:
                                                            'fas fa-user-tag fa-w-16 fa-fw fa-lg',
                                                        }
                                                      ),
                                                    }
                                                  ),
                                                }),
                                                Object(OI.jsx)(Op.a, {
                                                  title: 'Remove Employee',
                                                  placement: 'top',
                                                  sx: {
                                                    display: PJ.canFire
                                                      ? ''
                                                      : 'none',
                                                    backgroundColor:
                                                      'rgba(97, 97, 97, 0.9)',
                                                  },
                                                  arrow: true,
                                                  children: Object(OI.jsx)(
                                                    'div',
                                                    {
                                                      style: {
                                                        display: PJ.canFire
                                                          ? ''
                                                          : 'none',
                                                      },
                                                      children: Object(OI.jsx)(
                                                        'i',
                                                        {
                                                          onClick: B4,
                                                          id: BO.cid,
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
                                      BO.id
                                    )
                                  })
                                : Object(OI.jsxs)('div', {
                                    className: 'flex-centered',
                                    style: {
                                      padding: '32px',
                                      flexDirection: 'column',
                                      textAlign: 'center',
                                    },
                                    children: [
                                      Object(OI.jsx)('i', {
                                        className:
                                          'fas fa-frown fa-w-16 fa-fw fa-3x',
                                        style: {
                                          color: '#fff',
                                          marginBottom: '32px',
                                        },
                                      }),
                                      Object(OI.jsx)(OE.a, {
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
          P6 = Object(A3.a)({
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
          P7 = function () {
            var Pi = P6(),
              PD = Object(O4.useState)([]),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(O4.useState)([]),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1],
              Pf = Object(O4.useState)(false),
              PL = Object(O9.a)(Pf, 2),
              Py = PL[0],
              PU = PL[1],
              Pg = Object(O4.useState)(false),
              Pc = Object(O9.a)(Pg, 2),
              PJ = Pc[0],
              Pj = Pc[1],
              Pq = Object(O4.useState)(false),
              Pl = Object(O9.a)(Pq, 2),
              PN = Pl[0],
              Pr = Pl[1],
              PY = Object(O4.useState)(false),
              Ps = Object(O9.a)(PY, 2),
              Pu = Ps[0],
              Pm = Ps[1],
              PW = Object(O4.useState)(''),
              PR = Object(O9.a)(PW, 2),
              Pw = PR[0],
              PZ = PR[1],
              PH = Object(O4.useState)(''),
              V0 = Object(O9.a)(PH, 2),
              V1 = V0[0],
              V2 = V0[1],
              V3 = Object(O4.useState)(''),
              V4 = Object(O9.a)(V3, 2),
              V5 = V4[0],
              V6 = V4[1]
            Object(O4.useEffect)(function () {
              Ob('getMessageData', {}).then(function (V9) {
                PC(V9.data)
                Pv(V9.data)
                PZ(V9.mynumber)
              })
            }, [])
            var V7 = function (V8) {
              var V9 = ('' + V8)
                .replace(/\D/g, '')
                .match(/^(\d{3})(\d{3})(\d{4})$/)
              return V9 ? '(' + V9[1] + ') ' + V9[2] + '-' + V9[3] : V8
            }
            return (
              OA('updateMessages', function (V8) {
                PC(V8.data), Pv(V8.data), PZ(V8.mynumber)
              }),
              OA('closeApps', function () {
                Pm(false)
                PU(false)
                Pj(false)
                Pr(false)
                V2('')
                V6('')
              }),
              Object(OI.jsxs)(OI.Fragment, {
                children: [
                  Object(OI.jsx)('div', {
                    className: Pi.messageMessageModalContainer,
                    style: { display: Pu ? '' : 'none' },
                    children: Object(OI.jsxs)('div', {
                      className: Pi.messageMessageModalInnerContainer,
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: Py ? '' : 'none' },
                          children: Object(OI.jsxs)('div', {
                            className: 'lds-spinner',
                            children: [
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                              Object(OI.jsx)('div', {}),
                            ],
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: 'spinner-wrapper',
                          style: { display: PJ ? '' : 'none' },
                          children: Object(OI.jsx)(OS.Checkmark, {
                            size: '56px',
                            color: '#009688',
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'component-simple-form',
                          style: { display: PN ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Number',
                                    variant: 'standard',
                                    onChange: function (V8) {
                                      V2(V8.target.value)
                                    },
                                    value: V1,
                                    inputProps: { maxLength: 10 },
                                  }),
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              children: Object(OI.jsx)(OD.a, {
                                fullWidth: true,
                                sx: { width: '100%' },
                                children: Object(OI.jsx)(Oo.a, {
                                  multiline: true,
                                  rows: 2,
                                  id: 'input-with-icon-textfield',
                                  label: 'Message',
                                  variant: 'standard',
                                  onChange: function (V8) {
                                    V6(V8.target.value)
                                  },
                                  value: V5,
                                }),
                              }),
                            }),
                            Object(OI.jsxs)('div', {
                              className: 'buttons',
                              children: [
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      Pm(false)
                                    },
                                    size: 'small',
                                    color: 'warning',
                                    variant: 'contained',
                                    children: 'Cancel',
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  children: Object(OI.jsx)(OC.a, {
                                    onClick: function () {
                                      PU(true)
                                      Pr(true)
                                      Ob('sendMessage', {
                                        number: V1,
                                        message: V5,
                                      }).then(function (V9) {
                                        V2(''),
                                          V6(''),
                                          PU(false),
                                          Pj(true),
                                          setTimeout(function () {
                                            Pj(false)
                                            Pm(false)
                                            Pr(false)
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
                  Object(OI.jsx)(AB, {
                    emptyMessage: 0 === PX.length,
                    primaryActions: [
                      {
                        type: 'icon',
                        title: 'Send Message',
                        placement: 'left',
                        icon: 'fas fa-comment fa-w-16',
                        action: function (V8) {
                          Pm(true)
                        },
                        show: true,
                      },
                    ],
                    search: {
                      filter: ['msgDisplayName'],
                      list: Pa,
                      onChange: Pv,
                    },
                    children:
                      PX && PX.length > 0
                        ? PX.map(function (V8) {
                            var V9
                            return Object(OI.jsx)(Oi.b, {
                              to: '/chat/'.concat(
                                (null === (V9 = V8.receiver) || void 0 === V9
                                  ? void 0
                                  : V9.toString()) ===
                                  (null === Pw || void 0 === Pw
                                    ? void 0
                                    : Pw.toString())
                                  ? V8.sender
                                  : V8.receiver
                              ),
                              style: {
                                color: '#fff',
                                textDecoration: 'none',
                              },
                              children: Object(OI.jsxs)('div', {
                                className: 'component-paper cursor-pointer',
                                children: [
                                  Object(OI.jsx)('div', {
                                    className: 'notification',
                                    style: {
                                      display: 'none',
                                      backgroundColor: 'rgb(77, 208, 225)',
                                    },
                                  }),
                                  Object(OI.jsxs)('div', {
                                    className: 'main-container',
                                    children: [
                                      Object(OI.jsx)('div', {
                                        className: 'image',
                                        children: Object(OI.jsx)('i', {
                                          className:
                                            'fas fa-user-circle fa-w-16 fa-fw fa-3x',
                                        }),
                                      }),
                                      Object(OI.jsxs)('div', {
                                        className: 'details',
                                        children: [
                                          Object(OI.jsx)('div', {
                                            className: 'title',
                                            children: Object(OI.jsx)(OE.a, {
                                              style: {
                                                color: '#fff',
                                                wordBreak: 'break-word',
                                              },
                                              variant: 'body2',
                                              gutterBottom: true,
                                              children: V7(V8.msgDisplayName),
                                            }),
                                          }),
                                          Object(OI.jsx)('div', {
                                            className: 'description',
                                            children: Object(OI.jsx)('div', {
                                              className: 'flex-row',
                                              children: Object(OI.jsx)(OE.a, {
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
                                                children: V8.message,
                                              }),
                                            }),
                                          }),
                                        ],
                                      }),
                                      Object(OI.jsx)('div', {
                                        className: 'actions',
                                      }),
                                    ],
                                  }),
                                ],
                              }),
                            })
                          })
                        : Object(OI.jsx)(OI.Fragment, {}),
                  }),
                ],
              })
            )
          },
          P8 = Object(A3.a)({
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
          P9 = function (Pd) {
            var PD = Object(O4.useState)(false),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(O4.useState)(false),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1]
            OA('closeApps', function () {
              PC(false)
              Pv(false)
            })
            var Pf = Pd.message.match(
                /\b(http|https)?(:\/\/)?(\S*)\.(\w{2,4})(.*)/g
              ),
              PL = Pd.message.split(Pf[0])[0],
              Py = '\n\n Images Attached: ' + Pf[0].split(' ').length
            return Object(OI.jsxs)(OI.Fragment, {
              children: [
                Object(OI.jsxs)('div', {
                  onClick: function () {
                    PC(!Pa)
                  },
                  className: 'component-image-container',
                  style: { marginBottom: '5%' },
                  children: [
                    Object(OI.jsx)('div', {
                      children: Object(OI.jsx)(OE.a, {
                        style: {
                          color: '#fff',
                          wordBreak: 'break-word',
                        },
                        variant: 'body2',
                        gutterBottom: true,
                        children: Py,
                      }),
                    }),
                    Object(OI.jsxs)('div', {
                      className: Pa
                        ? 'container'
                        : 'container container-max-height',
                      children: [
                        Object(OI.jsxs)('div', {
                          className: 'blocker',
                          style: { display: Pa ? 'none' : '' },
                          children: [
                            Object(OI.jsx)('i', {
                              className: 'fas fa-eye fa-w-18 fa-fw fa-3x',
                              style: {
                                color: 'black',
                                marginTop: '1%',
                                textShadow: '0 0 black',
                              },
                            }),
                            Object(OI.jsx)(OE.a, {
                              style: {
                                color: '#fff',
                                wordBreak: 'break-word',
                              },
                              variant: 'body1',
                              gutterBottom: true,
                              children: 'Click to View',
                            }),
                            Object(OI.jsx)(OE.a, {
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
                        Object(OI.jsx)('div', {
                          onMouseEnter: function () {
                            Pa && Pv(true)
                          },
                          onMouseLeave: function () {
                            Pv(false)
                          },
                          className: Pa ? 'image' : '',
                          style: {
                            backgroundImage: Pa
                              ? 'url('.concat(Pf[0].split(' '[0]), ')')
                              : '',
                          },
                        }),
                        Object(OI.jsx)('div', { className: 'spacer' }),
                      ],
                    }),
                    Object(OI.jsx)(AK.a, {
                      open: PX,
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
                      children: Object(OI.jsx)('div', {
                        children: Object(OI.jsx)('img', {
                          alt: 'useful',
                          src: Pf[0].split(' '[0]),
                          style: {
                            maxHeight: '600px',
                            maxWidth: '800px',
                          },
                        }),
                      }),
                    }),
                  ],
                }),
                Object(OI.jsx)('div', {
                  className: 'inner '.concat(
                    Pd.sender === Pd.clientNumber ? 'inner-out' : 'inner-in'
                  ),
                  children: Object(OI.jsx)(OE.a, {
                    style: {
                      color: '#fff',
                      wordBreak: 'break-word',
                    },
                    variant: 'body2',
                    gutterBottom: true,
                    children: PL,
                  }),
                }),
              ],
            })
          },
          PO = function () {
            var Pi = P8(),
              PD = Object(O4.useState)([]),
              Po = Object(O9.a)(PD, 2),
              Pa = (Po[0], Po[1]),
              PC = Object(O4.useState)([]),
              PS = Object(O9.a)(PC, 2),
              PT = PS[0],
              PX = PS[1],
              Pv = Object(OT.c)(Oj),
              Pf = Object(O9.a)(Pv, 2),
              PL = Pf[0],
              Py = Pf[1],
              PU = Object(OT.c)(Oq),
              Pg = Object(O9.a)(PU, 2),
              Pc = (Pg[0], Pg[1]),
              PJ = Object(O4.useState)(''),
              Pj = Object(O9.a)(PJ, 2),
              Pq = Pj[0],
              Pl = Pj[1],
              PN = Object(O4.useState)(''),
              Pr = Object(O9.a)(PN, 2),
              PY = Pr[0],
              Ps = Pr[1],
              Pu = Object(O4.useState)(''),
              Pm = Object(O9.a)(Pu, 2),
              PW = (Pm[0], Pm[1]),
              PR = Object(O4.useRef)(null),
              Pw = Object(O4.useState)(false),
              PZ = Object(O9.a)(Pw, 2),
              PH = PZ[0],
              V0 = PZ[1],
              V1 = Object(Ok.g)().chatId,
              V2 = Object(OT.c)(OW),
              V3 = Object(O9.a)(V2, 2),
              V4 = V3[0]
            V3[1]
            Object(O4.useEffect)(
              function () {
                Ob('getChatData', { number: V1 }).then(function (V9) {
                  Pa(V9.messages),
                    PX(V9.messages),
                    Pl(V9.displayName),
                    Ps(V9.clientNumber),
                    V0(V9.isDisplayName)
                })
              },
              [V1]
            )
            var V5 = Object(Ok.f)(),
              V6 = function (V8) {
                var V9 = ('' + V8)
                  .replace(/\D/g, '')
                  .match(/^(\d{3})(\d{3})(\d{4})$/)
                return V9 ? '(' + V9[1] + ') ' + V9[2] + '-' + V9[3] : V8
              },
              V7 = function (V8) {
                for (
                  var VO = '', VA = '0123456789', VP = VA.length, VV = 0;
                  VV < V8;
                  VV++
                ) {
                  VO += VA.charAt(Math.floor(Math.random() * VP))
                }
                return VO
              }
            return (
              OA('updateChatMessages', function (V8) {
                if (V1.toString() === V8.sender.toString()) {
                  Pa(V8.messages)
                  PX(V8.messages)
                  Pl(V8.displayName)
                  Ps(V8.clientNumber)
                  V0(V8.isDisplayName)
                }
              }),
              OA('closeApps', function () {}),
              Object(OI.jsx)(OI.Fragment, {
                children: Object(OI.jsx)('div', {
                  className: Pi.chatOuterContainer,
                  style: { zIndex: 500 },
                  children: Object(OI.jsx)('div', {
                    className: Pi.chatInnerContainer,
                    children: Object(OI.jsxs)('div', {
                      className: 'messages-container',
                      children: [
                        Object(OI.jsxs)('div', {
                          className: Pi.chatSearch,
                          children: [
                            Object(OI.jsx)(Op.a, {
                              title: 'Go Back',
                              placement: 'right',
                              sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
                              arrow: true,
                              children: Object(OI.jsx)('div', {
                                style: {
                                  color: '#fff',
                                  width: '40px',
                                  display: 'flex',
                                  alignItems: 'center',
                                },
                                children: Object(OI.jsx)('i', {
                                  onClick: function () {
                                    V5.push('/messages')
                                  },
                                  className:
                                    'fas fa-chevron-left fa-w-10 fa-fw fa-lg',
                                }),
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              className: Pi.chatSearchWrapper,
                              children: Object(OI.jsx)('div', {
                                className: 'input-wrapper',
                                children: Object(OI.jsx)(OD.a, {
                                  fullWidth: true,
                                  sx: { width: '100%' },
                                  children: Object(OI.jsx)(Oo.a, {
                                    id: 'input-with-icon-textfield',
                                    label: 'Search',
                                    InputProps: {
                                      startAdornment: Object(OI.jsx)(Oa.a, {
                                        position: 'start',
                                        children: Object(OI.jsx)(Ab.a, {}),
                                      }),
                                    },
                                    variant: 'standard',
                                  }),
                                }),
                              }),
                            }),
                          ],
                        }),
                        Object(OI.jsx)('div', {
                          className: Pi.chatIcon,
                          children: Object(OI.jsx)('div', {
                            className: Pi.chatIconWrapper,
                            children: Object(OI.jsx)(Op.a, {
                              title: 'Call',
                              placement: 'left',
                              sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
                              arrow: true,
                              children: Object(OI.jsx)('i', {
                                onClick: function () {
                                  return (function (VO) {
                                    Ob('rd-ui:callStart', { number: VO })
                                    var VA = V7(4),
                                      VP = Ow()().unix(),
                                      VV = PL,
                                      Vb = {
                                        id: VA,
                                        number: VO,
                                        name: Pq,
                                        date: VP,
                                        state: 'out',
                                      },
                                      VB = [].concat(Object(O8.a)(VV || []), [Vb])
                                    Py(VB)
                                    Pc(VB)
                                  })(V1)
                                },
                                style: { fontSize: '1.2em' },
                                className: 'fas fa-phone fa-w-16 fa-fw fa-lg',
                              }),
                            }),
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: Pi.chatIcon,
                          style: {
                            display: PH ? 'none' : '',
                            right: '50px',
                          },
                          children: Object(OI.jsx)('div', {
                            className: Pi.chatIconWrapper,
                            children: Object(OI.jsx)(Op.a, {
                              title: 'Add Contact',
                              placement: 'left',
                              sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
                              arrow: true,
                              children: Object(OI.jsx)('i', {
                                onClick: function () {},
                                style: { fontSize: '1.2em' },
                                className: 'fas fa-user-plus fa-w-16 fa-fw fa-lg',
                              }),
                            }),
                          }),
                        }),
                        Object(OI.jsx)('div', {
                          className: Pi.chatMessages,
                          children: Object(OI.jsxs)('div', {
                            className: 'messages-container',
                            children: [
                              Object(OI.jsxs)('div', {
                                className: 'contact-info',
                                children: [
                                  Object(OI.jsx)('div', {
                                    className: 'icon',
                                    children: Object(OI.jsx)('i', {
                                      className:
                                        'fas fa-user-circle fa-w-16 fa-fw fa-2x',
                                    }),
                                  }),
                                  Object(OI.jsxs)('div', {
                                    className: 'text',
                                    children: [
                                      Object(OI.jsx)(OE.a, {
                                        style: {
                                          display: PH ? '' : 'none',
                                          color: '#fff',
                                          wordBreak: 'break-word',
                                        },
                                        variant: 'body2',
                                        gutterBottom: true,
                                        children: Pq,
                                      }),
                                      Object(OI.jsx)(OE.a, {
                                        style: {
                                          color: '#fff',
                                          wordBreak: 'break-word',
                                        },
                                        variant: 'body2',
                                        gutterBottom: true,
                                        children: V6(PH ? V1 : Pq),
                                      }),
                                    ],
                                  }),
                                ],
                              }),
                              Object(OI.jsx)('div', {
                                className: 'messages',
                                style: { marginBottom: '20px' },
                                children:
                                  PT && PT.length > 0
                                    ? PT.map(function (V8) {
                                        return Object(OI.jsxs)('div', {
                                          className: 'message '.concat(
                                            V8.sender === PY
                                              ? 'message-out'
                                              : 'message-in'
                                          ),
                                          children: [
                                            (V8.message.indexOf('imgur.com') >=
                                              0 &&
                                              V4) ||
                                            (V8.message.indexOf(
                                              'discordapp.com'
                                            ) >= 0 &&
                                              V4)
                                              ? Object(OI.jsx)(P9, {
                                                  message: V8.message,
                                                  sender: V8.sender,
                                                  clientNumber: PY,
                                                })
                                              : Object(OI.jsx)(OI.Fragment, {
                                                  children: Object(OI.jsx)(
                                                    'div',
                                                    {
                                                      className: 'inner '.concat(
                                                        V8.sender === PY
                                                          ? 'inner-out'
                                                          : 'inner-in'
                                                      ),
                                                      children: Object(OI.jsx)(
                                                        OE.a,
                                                        {
                                                          style: {
                                                            color: '#fff',
                                                            wordBreak:
                                                              'break-word',
                                                          },
                                                          variant: 'body2',
                                                          gutterBottom: true,
                                                          children: V8.message,
                                                        }
                                                      ),
                                                    }
                                                  ),
                                                }),
                                            Object(OI.jsx)('div', {
                                              className: 'timestamp '.concat(
                                                V8.sender === PY
                                                  ? 'timestamp-out'
                                                  : 'timestamp-in'
                                              ),
                                              children: Object(OI.jsx)(OE.a, {
                                                style: {
                                                  wordBreak: 'break-word',
                                                },
                                                variant: 'body2',
                                                gutterBottom: true,
                                                children: Ow()(
                                                  1000 * V8.unix
                                                ).fromNow(),
                                              }),
                                            }),
                                          ],
                                        })
                                      })
                                    : Object(OI.jsx)(OI.Fragment, {}),
                              }),
                              Object(OI.jsx)('div', {
                                className: 'send-message',
                                children: Object(OI.jsx)('textarea', {
                                  ref: PR,
                                  onKeyDown: function (V8) {
                                    if (13 === V8.keyCode) {
                                      if (
                                        void 0 === V8.target.value ||
                                        '' === V8.target.value
                                      ) {
                                        return
                                      }
                                      Ob('sendMessage', {
                                        number: V1,
                                        message: V8.target.value,
                                      }).then(function (VA) {
                                        PR.current.value = ''
                                        Pa(VA.messages)
                                        PX(VA.messages)
                                        Pl(VA.displayName)
                                        Ps(VA.clientNumber)
                                        V0(VA.isDisplayName)
                                        PW('')
                                      })
                                    }
                                  },
                                  onKeyPress: function (V8) {
                                    'Enter' === V8.key && V8.preventDefault()
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
          },
          PA = Object(A3.a)({
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
          PP = function () {
            var Pi = PA()
            return Object(OI.jsx)(OI.Fragment, {
              children: Object(OI.jsx)('div', {
                className: Pi.debtOuterContainer,
                style: { zIndex: 500 },
                children: Object(OI.jsx)('div', {
                  className: Pi.debtInnerContainer,
                  children: Object(OI.jsxs)('div', {
                    className: 'debt-container',
                    children: [
                      Object(OI.jsx)('div', {
                        className: Pi.debtSearch,
                        children: Object(OI.jsx)('div', {
                          className: Pi.debtSearchWrapper,
                          children: Object(OI.jsx)('div', {
                            className: 'input-wrapper',
                            children: Object(OI.jsx)(OD.a, {
                              fullWidth: true,
                              sx: { width: '100%' },
                              children: Object(OI.jsx)(Oo.a, {
                                id: 'input-with-icon-textfield',
                                label: 'Search',
                                InputProps: {
                                  startAdornment: Object(OI.jsx)(Oa.a, {
                                    position: 'start',
                                    children: Object(OI.jsx)(Ab.a, {}),
                                  }),
                                },
                                variant: 'standard',
                              }),
                            }),
                          }),
                        }),
                      }),
                      Object(OI.jsx)('div', {
                        className: Pi.debtIcon,
                        children: Object(OI.jsx)('div', {
                          className: Pi.debtIconWrapper,
                          children: Object(OI.jsx)(Op.a, {
                            title: 'Pay Loan',
                            placement: 'left',
                            sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
                            arrow: true,
                            children: Object(OI.jsx)('i', {
                              style: { fontSize: '1.2em' },
                              className: 'fas fa-donate fa-w-16 fa-fw fa-lg',
                            }),
                          }),
                        }),
                      }),
                      Object(OI.jsxs)('div', {
                        className: Pi.debtWrapper,
                        children: [
                          Object(OI.jsxs)('div', {
                            className: Pi.debtFees,
                            children: [
                              Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                  marginTop: '5px',
                                },
                                variant: 'body1',
                                gutterBottom: true,
                                children: 'Maintenance Fees',
                              }),
                              Object(OI.jsx)('div', {
                                className: 'component-paper cursor-pointer',
                                children: Object(OI.jsxs)('div', {
                                  className: 'main-container',
                                  children: [
                                    Object(OI.jsx)('div', {
                                      className: 'image',
                                      children: Object(OI.jsx)('i', {
                                        className:
                                          'fas fa-car fa-w-16 fa-fw fa-3x',
                                      }),
                                    }),
                                    Object(OI.jsxs)('div', {
                                      className: 'details',
                                      children: [
                                        Object(OI.jsx)('div', {
                                          className: 'title',
                                          children: Object(OI.jsx)(OE.a, {
                                            style: {
                                              color: '#fff',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                            children: '$670,000.00',
                                          }),
                                        }),
                                        Object(OI.jsx)('div', {
                                          className: 'description',
                                          children: Object(OI.jsx)('div', {
                                            className: 'flex-row',
                                            children: Object(OI.jsx)(OE.a, {
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
                                    Object(OI.jsx)('div', {
                                      className: 'actions',
                                    }),
                                  ],
                                }),
                              }),
                            ],
                          }),
                          Object(OI.jsxs)('div', {
                            className: Pi.debtLoans,
                            children: [
                              Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                  marginTop: '5px',
                                },
                                variant: 'body1',
                                gutterBottom: true,
                                children: 'Loans',
                              }),
                              Object(OI.jsx)('div', {
                                className: 'component-paper cursor-pointer',
                                children: Object(OI.jsxs)('div', {
                                  className: 'main-container',
                                  children: [
                                    Object(OI.jsx)('div', {
                                      className: 'image',
                                      children: Object(OI.jsx)('i', {
                                        className:
                                          'fas fa-file-invoice-dollar fa-w-16 fa-fw fa-3x',
                                      }),
                                    }),
                                    Object(OI.jsxs)('div', {
                                      className: 'details',
                                      children: [
                                        Object(OI.jsx)('div', {
                                          className: 'title',
                                          children: Object(OI.jsx)(OE.a, {
                                            style: {
                                              color: '#fff',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                            children: 'Diamond Hand Credit',
                                          }),
                                        }),
                                        Object(OI.jsx)('div', {
                                          className: 'description',
                                          children: Object(OI.jsx)('div', {
                                            className: 'flex-row',
                                            children: Object(OI.jsx)(OE.a, {
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
                                    Object(OI.jsx)('div', {
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
          PV = Object(A3.a)({
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
          Pb = function () {
            var Pd = PV()
            return Object(OI.jsx)(OI.Fragment, {
              children: Object(OI.jsx)('div', {
                className: Pd.wenmoOuterContainer,
                style: { zIndex: 500 },
                children: Object(OI.jsx)('div', {
                  className: Pd.wenmoInnerContainer,
                  children: Object(OI.jsxs)('div', {
                    className: 'wenmo-container',
                    children: [
                      Object(OI.jsx)('div', {
                        className: Pd.wenmoSearch,
                        children: Object(OI.jsx)('div', {
                          className: Pd.wenmoSearchWrapper,
                          children: Object(OI.jsx)('div', {
                            className: 'input-wrapper',
                            children: Object(OI.jsx)(OD.a, {
                              fullWidth: true,
                              sx: { width: '100%' },
                              children: Object(OI.jsx)(Oo.a, {
                                id: 'input-with-icon-textfield',
                                label: 'Search',
                                InputProps: {
                                  startAdornment: Object(OI.jsx)(Oa.a, {
                                    position: 'start',
                                    children: Object(OI.jsx)(Ab.a, {}),
                                  }),
                                },
                                variant: 'standard',
                              }),
                            }),
                          }),
                        }),
                      }),
                      Object(OI.jsx)('div', {
                        className: Pd.wenmoIcon,
                        children: Object(OI.jsx)('div', {
                          className: Pd.wenmoIconWrapper,
                          children: Object(OI.jsx)(Op.a, {
                            title: 'Send Money',
                            placement: 'left',
                            sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
                            arrow: true,
                            children: Object(OI.jsx)('i', {
                              style: { fontSize: '1.2em' },
                              className:
                                'fas fa-hand-holding-usd fa-w-16 fa-fw fa-lg',
                            }),
                          }),
                        }),
                      }),
                      Object(OI.jsxs)('div', {
                        className: Pd.wenmoLogs,
                        children: [
                          Object(OI.jsx)(OE.a, {
                            style: {
                              color: '#fff',
                              wordBreak: 'break-word',
                              marginTop: '5px',
                            },
                            variant: 'body1',
                            gutterBottom: true,
                            children: 'Transfers',
                          }),
                          Object(OI.jsx)('div', {
                            className: 'component-paper cursor-pointer',
                            children: Object(OI.jsxs)('div', {
                              className: 'main-container',
                              children: [
                                Object(OI.jsx)('div', {
                                  className: 'details',
                                  children: Object(OI.jsxs)('div', {
                                    className: 'description',
                                    children: [
                                      Object(OI.jsxs)('div', {
                                        className: 'flex-row',
                                        style: {
                                          justifyContent: 'space-between',
                                        },
                                        children: [
                                          Object(OI.jsx)(OE.a, {
                                            style: {
                                              color: '#8afc88',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                            children: '$2,200.00',
                                          }),
                                          Object(OI.jsx)(OE.a, {
                                            style: {
                                              color: '#fff',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                            children: 'Robin Riddle',
                                          }),
                                        ],
                                      }),
                                      Object(OI.jsx)('div', {
                                        className: 'flex-row',
                                        style: { justifyContent: 'flex-end' },
                                        children: Object(OI.jsx)(OE.a, {
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
                                Object(OI.jsx)('div', { className: 'actions' }),
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
          PB = O2(134),
          Ph = function () {
            return Object(OI.jsx)(OI.Fragment, {
              children: Object(OI.jsx)('div', {
                className: 'calculator-outer-container',
                style: { zIndex: 500 },
                children: Object(OI.jsx)('div', {
                  className: 'calculator-container',
                  style: { zIndex: 500 },
                  children: Object(OI.jsx)(PB.a, {}),
                }),
              }),
            })
          },
          Pk = function (Pd) {
            return Object(OI.jsx)(OI.Fragment, {
              children: Object(OI.jsx)(OE.a, {
                variant: Pd.variant,
                style: Pd.style,
                sx: Pd.sx,
                gutterBottom: Pd.gutterBottom,
                children: Pd.children,
              }),
            })
          },
          PE = function (Pd) {
            return Object(OI.jsx)(OI.Fragment, {
              children: Object(OI.jsx)('i', {
                onClick: Pd.onClick,
                className: 'fas fa-'.concat(Pd.icon, ' fa-').concat(Pd.size),
                style: { color: Pd.color },
                children: Pd.children,
              }),
            })
          },
          Px = Object(A3.a)({
            nameWrapper: {
              display: 'flex',
              justifyContent: 'space-between',
            },
          }),
          Pz = function () {
            var Pi = Object(O4.useState)([]),
              PD = Object(O9.a)(Pi, 2),
              Po = PD[0],
              Pa = PD[1],
              PC = Object(O4.useState)([]),
              PS = Object(O9.a)(PC, 2),
              PT = PS[0],
              PX = PS[1],
              Pv = Object(O4.useState)(''),
              Pf = Object(O9.a)(Pv, 2),
              PL = Pf[0],
              Py = Pf[1],
              PU = Object(O4.useState)(false),
              Pg = Object(O9.a)(PU, 2),
              Pc = Pg[0],
              PJ = Pg[1]
            Object(O4.useEffect)(function () {
              Ob('rd-ui:getDOJData', {}).then(function (Pl) {
                Pa(void 0 === Pl.data.list ? [] : Pl.data.list)
                PX(void 0 === Pl.data.list ? [] : Pl.data.list)
                Py(Pl.data.status)
                PJ(void 0 !== Pl.data.granted && Pl.data.granted)
              })
            }, [])
            var Pj = Px(),
              Pq = {
                Lawyer: PT.filter(function (Pl) {
                  return 'lawyer' === Pl.job
                }),
                Judge: PT.filter(function (Pl) {
                  return 'judge' === Pl.job
                }),
              }
            return Object(OI.jsxs)(AB, {
              emptyMessage: 0 === PT.length,
              primaryActions: [],
              search: {
                filter: ['name'],
                list: Po,
                onChange: PX,
              },
              children: [
                Pc &&
                  Object(OI.jsx)('div', {
                    children: Object(OI.jsx)('div', {
                      style: {
                        textAlign: 'left',
                        marginTop: 8,
                        marginBottom: 8,
                      },
                      children: Object(OI.jsx)(Ay, {
                        label: 'Status',
                        value: PL,
                        onChange: function (Pl) {
                          return (function (Pr) {
                            Ob('rd-ui:setDOJStatus', { status: Pr }).then(
                              function (PY) {
                                Pa(void 0 === PY.data.list ? [] : PY.data.list)
                                PX(void 0 === PY.data.list ? [] : PY.data.list)
                                PJ(void 0 !== PY.data.granted && PY.data.granted)
                                Py(PY.data.status)
                              }
                            )
                            Py(Pr)
                          })(Pl)
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
                Object.keys(Pq)
                  .filter(function (Pl) {
                    return !!Pq[Pl].length
                  })
                  .map(function (Pl) {
                    return Object(OI.jsxs)(
                      'div',
                      {
                        style: {
                          marginBottom: 8,
                          paddingBottom: 8,
                          borderBottom: '1px solid white',
                        },
                        children: [
                          Object(OI.jsxs)(Pk, {
                            style: {
                              color: '#fff',
                              wordBreak: 'break-word',
                              marginBottom: 8,
                            },
                            variant: 'body1',
                            gutterBottom: true,
                            children: [Pl, '(s)'],
                          }),
                          Pq[Pl].map(function (PY, Ps) {
                            return Object(OI.jsxs)(
                              'div',
                              {
                                className: Pj.nameWrapper,
                                children: [
                                  Object(OI.jsx)(Pk, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'body2',
                                    gutterBottom: true,
                                    children: PY.name,
                                  }),
                                  Object(OI.jsx)(Pk, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'body2',
                                    gutterBottom: true,
                                    children: PY.status,
                                  }),
                                  Object(OI.jsx)('div', {
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Call',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)(PE, {
                                        onClick: function () {
                                          Ob('rd-ui:callStart', {
                                            number: Number(PY.phone),
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
                              Ps
                            )
                          }),
                        ],
                      },
                      Pl
                    )
                  }),
              ],
            })
          },
          PQ = Object(A3.a)({
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
          Pp = function (Pd) {
            var PD = Object(O4.useState)(false),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = Po[1],
              PS = Object(OT.c)(OX),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1],
              Pf = function (PL) {
                Pv(PL)
              }
            return Object(OI.jsx)(OI.Fragment, {
              children: Object(OI.jsxs)(
                'div',
                {
                  id: Pd.id,
                  className: 'component-paper cursor-pointer',
                  onClick: function () {
                    PC(!Pa)
                  },
                  onMouseEnter: function (PL) {
                    return Pf(Pd.id)
                  },
                  onMouseLeave: function () {
                    return Pf('')
                  },
                  children: [
                    Object(OI.jsxs)('div', {
                      className: 'main-container',
                      children: [
                        Object(OI.jsx)('div', {
                          className: 'image',
                          children: Object(OI.jsx)('i', {
                            className: ''.concat(Pd.icon, ' fa-w-16 fa-fw fa-3x'),
                          }),
                        }),
                        Object(OI.jsxs)('div', {
                          className: 'details',
                          children: [
                            Object(OI.jsx)('div', {
                              className: 'title',
                              children: Object(OI.jsx)(OE.a, {
                                style: {
                                  color: '#fff',
                                  wordBreak: 'break-word',
                                },
                                variant: 'body2',
                                gutterBottom: true,
                                children: Pd.name,
                              }),
                            }),
                            Object(OI.jsx)('div', {
                              className: 'description',
                              children: Object(OI.jsx)('div', {
                                className: 'flex-row',
                                children: Object(OI.jsx)(OE.a, {
                                  style: {
                                    color: '#fff',
                                    wordBreak: 'break-word',
                                  },
                                  variant: 'body2',
                                  gutterBottom: true,
                                  children: Pd.description,
                                }),
                              }),
                            }),
                          ],
                        }),
                        Object(OI.jsx)('div', {
                          className:
                            PX.toString() === Pd.id.toString()
                              ? 'actions actions-show'
                              : 'actions',
                          children: Object(OI.jsx)(Op.a, {
                            title: 'Place Bet',
                            placement: 'top',
                            sx: { backgroundColor: 'rgba(97, 97, 97, 0.9)' },
                            arrow: true,
                            children: Object(OI.jsx)('div', {
                              children: Object(OI.jsx)('i', {
                                onClick: function (PL) {
                                  PL.stopPropagation()
                                },
                                id: Pd.id,
                                className:
                                  'fas fa-dollar-sign fa-w-16 fa-fw fa-lg',
                              }),
                            }),
                          }),
                        }),
                      ],
                    }),
                    Object(OI.jsxs)(Ad.a, {
                      in: Pa,
                      timeout: 'auto',
                      unmountOnExit: true,
                      children: [
                        Object(OI.jsx)(OD.a, {
                          sx: {
                            width: '85%',
                            marginLeft: '7.5%',
                            marginBottom: '1.5%',
                          },
                          children: Object(OI.jsx)(Oo.a, {
                            id: 'input-with-icon-textfield',
                            variant: 'standard',
                            value: 'Bovice ($323k / 66.5%)',
                            InputProps: {
                              readOnly: true,
                              startAdornment: Object(OI.jsx)(Oa.a, {
                                position: 'start',
                                children: Object(OI.jsx)('i', {
                                  className: 'fas fa-funnel-dollar',
                                  style: { color: 'white' },
                                }),
                              }),
                            },
                          }),
                        }),
                        Object(OI.jsx)(OD.a, {
                          sx: {
                            width: '85%',
                            marginLeft: '7.5%',
                            marginBottom: '1.5%',
                          },
                          children: Object(OI.jsx)(Oo.a, {
                            id: 'input-with-icon-textfield',
                            variant: 'standard',
                            value: 'Kael Soze ($162k / 33.5%)',
                            InputProps: {
                              readOnly: true,
                              startAdornment: Object(OI.jsx)(Oa.a, {
                                position: 'start',
                                children: Object(OI.jsx)('i', {
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
                Pd.id
              ),
            })
          },
          PM = function () {
            PQ()
            var PD = Object(O4.useState)([
                {
                  id: '1',
                  event: 'VLC 3 Main Event',
                  fighters: 'Kael Soze VS Bovice',
                },
              ]),
              Po = Object(O9.a)(PD, 2),
              Pa = Po[0],
              PC = (Po[1], Object(O4.useState)(false)),
              PS = Object(O9.a)(PC, 2),
              PT = (PS[0], PS[1]),
              PX = Object(O4.useState)(false),
              Pv = Object(O9.a)(PX, 2),
              Pf = (Pv[0], Pv[1]),
              PL = Object(O4.useState)(false),
              Py = Object(O9.a)(PL, 2),
              PU = (Py[0], Py[1])
            Object(O4.useEffect)(function () {}, [])
            OA('closeApps', function () {
              PT(false)
              PU(false)
              Pf(false)
            })
            return Object(OI.jsx)(OI.Fragment, {
              children: Object(OI.jsxs)(AB, {
                emptyMessage: 0 === Pa.length,
                primaryActions: [],
                search: [],
                children: [
                  Object(OI.jsx)('div', {
                    style: {
                      display: 'flex',
                      justifyContent: 'center',
                      marginBottom: '15%',
                    },
                    children: Object(OI.jsx)('i', {
                      className: 'fas fa-gem fa-3x',
                      style: { color: 'white' },
                    }),
                  }),
                  Pa && Pa.length > 0
                    ? Pa.map(function (Pc) {
                        return Object(OI.jsx)(Pp, {
                          id: Pc.id,
                          icon: 'fas fa-dollar-sign',
                          name: Pc.event,
                          description: Pc.fighters,
                          fighters: [],
                        })
                      })
                    : Object(OI.jsx)(OI.Fragment, {}),
                ],
              }),
            })
          },
          PF = Object(A3.a)({
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
          PI = function () {
            PF()
            var Pi = Object(OT.c)(OX),
              PD = Object(O9.a)(Pi, 2),
              Po = PD[0],
              Pa = PD[1],
              PC = Object(O4.useState)([]),
              PS = Object(O9.a)(PC, 2),
              PT = PS[0],
              PX = PS[1],
              Pv = Object(O4.useState)([]),
              Pf = Object(O9.a)(Pv, 2),
              PL = Pf[0],
              Py = Pf[1],
              PU = Object(O4.useState)(false),
              Pg = Object(O9.a)(PU, 2),
              Pc = Pg[0],
              PJ = Pg[1],
              Pj = Object(O4.useState)(false),
              Pq = Object(O9.a)(Pj, 2),
              Pl = (Pq[0], Pq[1]),
              PN = Object(O4.useState)(false),
              Pr = Object(O9.a)(PN, 2),
              PY = (Pr[0], Pr[1]),
              Ps = Object(O4.useState)(false),
              Pu = Object(O9.a)(Ps, 2),
              Pm = (Pu[0], Pu[1])
            Object(O4.useEffect)(function () {
              Ob('getUnitData', {}).then(function (V2) {
                PX(V2.data), Py(V2.data), PJ(V2.employed)
              })
            }, [])
            var PW = function (V1) {
                Pa(V1.currentTarget.id)
              },
              PR = function () {
                Pa('')
              }
            OA('closeApps', function () {
              Pl(false)
              PY(false)
              Pm(false)
            })
            var Pw = O5.a.useState(0),
              PZ = Object(O9.a)(Pw, 2),
              PH = PZ[0],
              V0 = PZ[1]
            return Object(OI.jsx)(OI.Fragment, {
              children: Object(OI.jsxs)(AB, {
                emptyMessage: 0 === PL.length,
                primaryActions: [],
                search: {
                  filter: ['storage_id', 'storage_business', 'storage_size'],
                  list: PT,
                  onChange: Py,
                },
                children: [
                  Object(OI.jsxs)(Av.a, {
                    centered: true,
                    variant: 'fullWidth',
                    value: PH,
                    onChange: function (V1, V2) {
                      0 === V2
                        ? (console.log('tab is 0, fetch owned data'),
                          Ob('getUnitData', {}).then(function (V4) {
                            PX(V4.data)
                            Py(V4.data)
                            V0(V2)
                          }))
                        : 1 === V2 &&
                          (console.log('tab is 1, fetch manage data'),
                          Ob('getManageData', {}).then(function (V4) {
                            PX(V4.data)
                            Py(V4.data)
                            V0(V2)
                          }))
                    },
                    'aria-label': 'icon tabs example',
                    sx: { display: Pc ? '' : 'none' },
                    children: [
                      Object(OI.jsx)(Af.a, { label: 'Owned' }),
                      Object(OI.jsx)(Af.a, { label: 'Manage' }),
                    ],
                  }),
                  Object(OI.jsx)('div', {
                    style: {
                      display: 0 === PH ? '' : 'none',
                      marginTop: Pc ? '10%' : 'unset',
                    },
                    children:
                      PL && PL.length > 0
                        ? PL.map(function (V1) {
                            return Object(OI.jsx)(
                              'div',
                              {
                                id: V1.id,
                                className: 'component-paper cursor-pointer',
                                onMouseEnter: PW,
                                onMouseLeave: PR,
                                children: Object(OI.jsxs)('div', {
                                  className: 'main-container',
                                  children: [
                                    Object(OI.jsx)('div', {
                                      className: 'image',
                                      children: Object(OI.jsx)('i', {
                                        className:
                                          'fas fa-archive fa-w-16 fa-fw fa-3x',
                                      }),
                                    }),
                                    Object(OI.jsxs)('div', {
                                      className: 'details',
                                      children: [
                                        Object(OI.jsx)('div', {
                                          className: 'title',
                                          children: Object(OI.jsxs)(OE.a, {
                                            style: {
                                              color: '#fff',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                            children: [
                                              V1.storage_id,
                                              ' ',
                                              '('.concat(V1.storage_size, ')'),
                                              ' ',
                                            ],
                                          }),
                                        }),
                                        Object(OI.jsx)('div', {
                                          className: 'description',
                                          children: Object(OI.jsx)('div', {
                                            className: 'flex-row',
                                            children: Object(OI.jsxs)(OE.a, {
                                              style: {
                                                color: '#fff',
                                                wordBreak: 'break-word',
                                              },
                                              variant: 'body2',
                                              gutterBottom: true,
                                              children: [
                                                'Business: ',
                                                V1.storage_business,
                                              ],
                                            }),
                                          }),
                                        }),
                                      ],
                                    }),
                                    Object(OI.jsxs)('div', {
                                      className:
                                        Po.toString() === V1.id.toString()
                                          ? 'actions actions-show'
                                          : 'actions',
                                      children: [
                                        Object(OI.jsx)(Op.a, {
                                          title: 'Manage Unit',
                                          placement: 'top',
                                          sx: {
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('div', {
                                            children: Object(OI.jsx)('i', {
                                              id: V1.id,
                                              className:
                                                'fas fa-cog fa-w-16 fa-fw fa-lg',
                                            }),
                                          }),
                                        }),
                                        Object(OI.jsx)(Op.a, {
                                          title: 'Pay Unit',
                                          placement: 'top',
                                          sx: {
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('div', {
                                            children: Object(OI.jsx)('i', {
                                              id: V1.id,
                                              className:
                                                'fas fa-dollar-sign fa-w-16 fa-fw fa-lg',
                                            }),
                                          }),
                                        }),
                                        Object(OI.jsx)(Op.a, {
                                          title: 'Set GPS',
                                          placement: 'top',
                                          sx: {
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('div', {
                                            children: Object(OI.jsx)('i', {
                                              id: V1.id,
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
                              V1.id
                            )
                          })
                        : Object(OI.jsx)(OI.Fragment, {}),
                  }),
                  Object(OI.jsx)('div', {
                    style: {
                      display: 1 === PH && Pc ? '' : 'none',
                      marginTop: '10%',
                    },
                    children:
                      PL && PL.length > 0
                        ? PL.map(function (V1) {
                            return Object(OI.jsx)(
                              'div',
                              {
                                id: V1.id,
                                className: 'component-paper cursor-pointer',
                                onMouseEnter: PW,
                                onMouseLeave: PR,
                                children: Object(OI.jsxs)('div', {
                                  className: 'main-container',
                                  children: [
                                    Object(OI.jsx)('div', {
                                      className: 'image',
                                      children: Object(OI.jsx)('i', {
                                        className:
                                          'fas fa-archive fa-w-16 fa-fw fa-3x',
                                      }),
                                    }),
                                    Object(OI.jsxs)('div', {
                                      className: 'details',
                                      children: [
                                        Object(OI.jsx)('div', {
                                          className: 'title',
                                          children: Object(OI.jsxs)(OE.a, {
                                            style: {
                                              color: '#fff',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                            children: [
                                              V1.storage_id,
                                              ' ',
                                              '('.concat(V1.storage_size, ')'),
                                              ' ',
                                            ],
                                          }),
                                        }),
                                        Object(OI.jsx)('div', {
                                          className: 'description',
                                          children: Object(OI.jsx)('div', {
                                            className: 'flex-row',
                                            children: Object(OI.jsxs)(OE.a, {
                                              style: {
                                                color: '#fff',
                                                wordBreak: 'break-word',
                                              },
                                              variant: 'body2',
                                              gutterBottom: true,
                                              children: [
                                                'Business: ',
                                                V1.storage_business,
                                              ],
                                            }),
                                          }),
                                        }),
                                      ],
                                    }),
                                    Object(OI.jsxs)('div', {
                                      className:
                                        Po.toString() === V1.id.toString()
                                          ? 'actions actions-show'
                                          : 'actions',
                                      children: [
                                        Object(OI.jsx)(Op.a, {
                                          title: 'Manage Tenant',
                                          placement: 'top',
                                          sx: {
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('div', {
                                            children: Object(OI.jsx)('i', {
                                              id: V1.id,
                                              className:
                                                'fas fa-user-edit fa-w-16 fa-fw fa-lg',
                                            }),
                                          }),
                                        }),
                                        Object(OI.jsx)(Op.a, {
                                          title: 'Remove Tenant',
                                          placement: 'top',
                                          sx: {
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('div', {
                                            children: Object(OI.jsx)('i', {
                                              id: V1.id,
                                              className:
                                                'fas fa-user-times fa-w-16 fa-fw fa-lg',
                                            }),
                                          }),
                                        }),
                                        Object(OI.jsx)(Op.a, {
                                          title: 'Manage Unit',
                                          placement: 'top',
                                          sx: {
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('div', {
                                            children: Object(OI.jsx)('i', {
                                              id: V1.id,
                                              className:
                                                'fas fa-cog fa-w-16 fa-fw fa-lg',
                                            }),
                                          }),
                                        }),
                                        Object(OI.jsx)(Op.a, {
                                          title: 'Set GPS',
                                          placement: 'top',
                                          sx: {
                                            backgroundColor:
                                              'rgba(97, 97, 97, 0.9)',
                                          },
                                          arrow: true,
                                          children: Object(OI.jsx)('div', {
                                            children: Object(OI.jsx)('i', {
                                              id: V1.id,
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
                              V1.id
                            )
                          })
                        : Object(OI.jsx)(OI.Fragment, {}),
                  }),
                ],
              }),
            })
          },
          PK = Object(A3.a)({
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
          PG = Object(Ox.a)({
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
          Pn = function () {
            var Pi = PK(),
              PD = OM(),
              Po = PD.addNotification,
              Pa = PD.deleteNotification,
              PC = PD.notifications,
              PS = Object(O4.useState)(0),
              PT = Object(O9.a)(PS, 2),
              PX = PT[0],
              Pv = PT[1],
              Pf = Object(O4.useState)(false),
              PL = Object(O9.a)(Pf, 2),
              Py = PL[0],
              PU = PL[1],
              Pg = Object(O4.useState)(false),
              Pc = Object(O9.a)(Pg, 2),
              PJ = Pc[0],
              Pj = Pc[1],
              Pq = Object(OT.c)(OJ),
              Pl = Object(O9.a)(Pq, 2),
              PN = (Pl[0], Pl[1]),
              Pr = Object(O4.useState)(false),
              PY = Object(O9.a)(Pr, 2),
              Ps = PY[0],
              Pu = PY[1],
              Pm = Object(O4.useState)(0),
              PW = Object(O9.a)(Pm, 2),
              PR = PW[0],
              Pw = PW[1],
              PZ = Object(O4.useState)('00:00'),
              PH = Object(O9.a)(PZ, 2),
              V0 = PH[0],
              V1 = PH[1],
              V2 = Object(O4.useState)(false),
              V3 = Object(O9.a)(V2, 2),
              V4 = V3[0],
              V5 = V3[1],
              V6 = Object(O4.useState)(false),
              V7 = Object(O9.a)(V6, 2),
              V8 = V7[0],
              V9 = V7[1],
              VO = Object(O4.useState)(false),
              VA = Object(O9.a)(VO, 2),
              VP = VA[0],
              VV = VA[1],
              Vb = Object(O4.useState)(''),
              VB = Object(O9.a)(Vb, 2),
              Vh = VB[0],
              Vk = VB[1],
              VE = Object(O4.useState)(false),
              Vx = Object(O9.a)(VE, 2),
              Vz = Vx[0],
              VQ = Vx[1],
              Vp = Object(O4.useState)(false),
              VM = Object(O9.a)(Vp, 2),
              VF = VM[0],
              VI = VM[1],
              VK = Object(O4.useState)(false),
              VG = Object(O9.a)(VK, 2),
              Vn = VG[0],
              Vd = VG[1],
              Vi = Object(O4.useState)(''),
              VD = Object(O9.a)(Vi, 2),
              Vo = VD[0],
              Va = VD[1],
              VC = Object(O4.useState)(false),
              VS = Object(O9.a)(VC, 2),
              VT = VS[0],
              VX = VS[1],
              Vv = Object(O4.useState)(false),
              Vf = Object(O9.a)(Vv, 2),
              VL = (Vf[0], Vf[1]),
              Vy = Object(OT.c)(Or),
              VU = Object(O9.a)(Vy, 2),
              Vg = VU[0],
              Vc = VU[1],
              VJ = Object(OT.c)(OY),
              Vj = Object(O9.a)(VJ, 2),
              Vq = Vj[0],
              Vl = Vj[1],
              VN = Object(OT.c)(Os),
              Vr = Object(O9.a)(VN, 2),
              VY = Vr[0],
              Vs = Vr[1],
              Vu = Object(OT.c)(Ou),
              Vm = Object(O9.a)(Vu, 2),
              VW = Vm[0],
              VR = Vm[1],
              Vw = Object(OT.c)(Om),
              VZ = Object(O9.a)(Vw, 2),
              VH = VZ[0],
              b0 = VZ[1],
              b1 = Object(OT.c)(OW),
              b2 = Object(O9.a)(b1, 2),
              b3 = (b2[0], b2[1]),
              b4 = Object(OT.c)(Oj),
              b5 = Object(O9.a)(b4, 2),
              b6 = b5[0],
              b7 = b5[1],
              b8 = Object(OT.c)(Oq),
              b9 = Object(O9.a)(b8, 2),
              bO = (b9[0], b9[1])
            Object(O4.useEffect)(function () {
              window.invokeNative || PU(true)
            })
            OA('openPhone', function (bV) {
              PU(bV.bool)
              Pw(bV.serverid)
              V9(bV.hiddenapp)
              Pu(bV.hasDongle)
              PN(bV.hasVPN)
              VX(bV.notifications)
            })
            OA('closePhone', function (bV) {
              PU(false)
            })
            OA('setTime', function (bV) {
              V1(bV)
            })
            OA('setSrc', function (bV) {
              Pw(bV)
            })
            OA('handleWifi', function (bV) {
              true === bV.show ? (V5(true), V9(false)) : (V5(false), V9(false))
            })
            OA('toggleDevmode', function (bV) {
              true === bV.bool ? Pj(true) : Pj(false)
            })
            var bA = Object(Ok.f)()
            OA('closeApps', function () {
              bA.push('/'),
                Vk(''),
                VV(false),
                Vd(false),
                VQ(false),
                VI(false),
                VL(false),
                Va('home')
            })
            var bP = function (bV) {
              var bb = ('' + bV)
                .replace(/\D/g, '')
                .match(/^(\d{3})(\d{3})(\d{4})$/)
              return bb ? '(' + bb[1] + ') ' + bb[2] + '-' + bb[3] : bV
            }
            return (
              OA('setPreferences', function (bV) {
                void 0 !== bV['phone.misc.brand']
                  ? Vc(bV['phone.misc.brand'])
                  : Vc('android')
                void 0 !== bV['phone.misc.background']
                  ? Vl(bV['phone.misc.background'])
                  : Vl('https://i.imgur.com/3KTfLIV.jpg')
                void 0 !== bV['phone.misc.receive.sms'] &&
                  Vs(bV['phone.misc.receive.sms'])
                void 0 !== bV['phone.misc.new.tweet'] &&
                  VR(bV['phone.misc.new.tweet'])
                void 0 !== bV['phone.misc.receive.email'] &&
                  b0(bV['phone.misc.receive.email'])
                void 0 !== bV['phone.misc.embedded.images'] &&
                  b3(bV['phone.misc.embedded.images'])
              }),
              OA('setNotify', function (bV) {
                var bB = bV.data
                if ((Pw(bV.serverid), 'phone' === bV.app)) {
                  switch (bB.action) {
                    case 'notification':
                      switch (bB.target_app) {
                        case 'twitter':
                          if ('twitter' === Vo && !bB.show_even_if_app_active) {
                            return
                          }
                          if (!VW) {
                            return
                          }
                          Po({
                            id: PX,
                            isCall: false,
                            calls: {
                              receive: false,
                              dialing: false,
                              progress: false,
                              inactive: false,
                            },
                            isConfirmation: false,
                            confirmation: {},
                            header: bB.title,
                            content: bB.body,
                            isPerma: false,
                            cancelButton: false,
                            jobGroupId: 0,
                            icon: 'fab fa-twitter',
                            iconColor: '#fff',
                            bgColor: '#0eabef',
                          })
                          break
                        case 'messages':
                          if (!VY) {
                            return
                          }
                          Po({
                            id: PX,
                            isCall: false,
                            calls: {
                              receive: false,
                              dialing: false,
                              progress: false,
                              inactive: false,
                            },
                            isConfirmation: false,
                            confirmation: {},
                            header: bP(bB.title),
                            content: bB.body,
                            isPerma: false,
                            cancelButton: false,
                            jobGroupId: 0,
                            icon: 'fas fa-comment',
                            iconColor: '#fff',
                            bgColor: '#8dc348',
                          })
                          break
                        case 'email':
                          if (!VH) {
                            return
                          }
                          Po({
                            id: PX,
                            isCall: false,
                            calls: {
                              receive: false,
                              dialing: false,
                              progress: false,
                              inactive: false,
                            },
                            isConfirmation: false,
                            confirmation: {},
                            header: bB.title,
                            content: bB.body,
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
                          Po({
                            id: PX,
                            isCall: false,
                            calls: {
                              receive: false,
                              dialing: false,
                              progress: false,
                              inactive: false,
                            },
                            isConfirmation: false,
                            confirmation: {},
                            header: bB.title,
                            content: bB.body,
                            isPerma: false,
                            cancelButton: false,
                            jobGroupId: 0,
                            icon: 'fas fa-home',
                            iconColor: '#fff',
                            bgColor: bB.bgColor,
                          })
                      }
                      break
                    case 'call-receiving':
                      var bh = (function (bp) {
                          for (
                            var bF = '',
                              bI = '0123456789',
                              bK = bI.length,
                              bG = 0;
                            bG < bp;
                            bG++
                          ) {
                            bF += bI.charAt(Math.floor(Math.random() * bK))
                          }
                          return bF
                        })(4),
                        bk = bP(bB.name),
                        bE = Ow()().unix(),
                        bz = {
                          id: bh,
                          number: bB.number,
                          name: bk,
                          date: bE,
                          state: 'in',
                        },
                        bQ = [].concat(Object(O8.a)(bx || []), [bz])
                      b7(bQ),
                        bO(bQ),
                        Po({
                          id: PX,
                          isCall: true,
                          calls: {
                            callId: bB.callId,
                            receive: true,
                            dialing: false,
                            progress: false,
                            inactive: true,
                          },
                          isConfirmation: false,
                          confirmation: {},
                          header: bP(bB.name),
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
                      Po({
                        id: PX,
                        isCall: true,
                        calls: {
                          callId: bB.callId,
                          receive: false,
                          dialing: false,
                          progress: true,
                          inactive: false,
                        },
                        isConfirmation: false,
                        confirmation: {},
                        header: bP(bB.number),
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
                      Po({
                        id: PX,
                        isCall: true,
                        calls: {
                          callId: bB.callId,
                          receive: false,
                          dialing: true,
                          progress: false,
                          inactive: false,
                        },
                        isConfirmation: false,
                        confirmation: {},
                        header: bP(bB.number),
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
                      Po({
                        id: PX,
                        isCall: false,
                        calls: {
                          receive: false,
                          dialing: false,
                          progress: false,
                          inactive: true,
                        },
                        isConfirmation: false,
                        confirmation: {},
                        header: bP(bB.number),
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
                      if ('home-screen' === bB.appName) {
                        Po({
                          id: PX,
                          isCall: false,
                          calls: {
                            receive: false,
                            dialing: false,
                            progress: false,
                            inactive: false,
                          },
                          isConfirmation: true,
                          confirmation: {
                            id: bB['_data'].confirmationId,
                            onAccept: bB.onAccept,
                            onReject: bB.onReject,
                            timeOut: bB.timeOut,
                          },
                          header: bB.title,
                          content: bB.text,
                          isPerma: false,
                          cancelButton: false,
                          jobGroupId: 0,
                          icon: 'fas fa-'.concat(bB.icon.name),
                          iconColor: bB.icon.color,
                          bgColor: bB.bgColor,
                        })
                      }
                      break
                    case 'job-notification':
                      Po({
                        id: PX,
                        isCall: false,
                        calls: {
                          receive: false,
                          dialing: false,
                          progress: false,
                          inactive: false,
                        },
                        isConfirmation: false,
                        confirmation: {},
                        header: bB.title,
                        content: bB.text,
                        isPerma: true,
                        cancelButton: bB.cancelButton,
                        jobGroupId: bB.jobGroupId,
                        icon: 'fas fa-'.concat(bB.icon.name),
                        iconColor: bB.icon.color,
                        bgColor: bB.bgColor,
                      })
                      break
                    case 'racing-alias-set':
                      Po({
                        id: PX,
                        isCall: false,
                        calls: {
                          receive: false,
                          dialing: false,
                          progress: false,
                          inactive: false,
                        },
                        isConfirmation: false,
                        confirmation: {},
                        header: bB.title,
                        content: bB.text,
                        isPerma: false,
                        cancelButton: false,
                        jobGroupId: 0,
                        icon: 'fas fa-flag-checkered',
                        iconColor: '#fff',
                        bgColor: '#177330',
                      })
                  }
                }
                Pv(PX + 1)
                'job-notification' === bB.action &&
                  Ob('setJobNotifcationId', { id: PX })
              }),
              ((function (bV) {
                var bB = Object(O4.useRef)(OO)
                Object(O4.useEffect)(
                  function () {
                    bB.current = bV
                  },
                  [bV]
                )
                Object(O4.useEffect)(function () {
                  var bk = function (bx) {
                    Oh.includes(bx.code) && (bB.current(false), Ob('hideFrame'))
                  }
                  return (
                    window.addEventListener('keydown', bk),
                    function () {
                      return window.removeEventListener('keydown', bk)
                    }
                  )
                }, [])
              })(PU),
              Object(OI.jsx)('div', {
                className: 'App',
                children: Object(OI.jsx)(Oz.a, {
                  theme: PG,
                  children: Object(OI.jsxs)(OQ.a, {
                    container: true,
                    className: Pi.root,
                    children: [
                      Object(OI.jsxs)('div', {
                        className: Pi.phoneContainer,
                        style: {
                          bottom: Py ? '12px' : PC.length ? '-540px' : '-1000px',
                          background: 'url('.concat(
                            Vq,
                            ') 0% 0% / cover no-repeat'
                          ),
                        },
                        children: [
                          ' ',
                          Object(OI.jsxs)('div', {
                            className: 'notch',
                            style: {
                              display: 'ios' === Vg ? '' : 'none',
                              zIndex: '505',
                            },
                            children: [
                              Object(OI.jsx)('div', { className: 'camera' }),
                              Object(OI.jsx)('div', { className: 'speaker' }),
                            ],
                          }),
                          Object(OI.jsxs)('div', {
                            className: Pi.phoneTopContainer,
                            style: { zIndex: 501 },
                            children: [
                              Object(OI.jsxs)('div', {
                                className: Pi.phoneTopLeftContainer,
                                children: [
                                  Object(OI.jsx)(OE.a, {
                                    style: {
                                      wordBreak: 'break-word',
                                      fontSize: '0.75rem',
                                      lineHeight: '0',
                                      textShadow:
                                        'rgb(55 71 79) -1px 1px 0px, rgb(55 71 79) 1px 1px 0px, rgb(55 71 79) 1px -1px 0px, rgb(55 71 79) -1px -1px 0px',
                                    },
                                    variant: 'body2',
                                    gutterBottom: true,
                                    children: V0,
                                  }),
                                  Object(OI.jsx)('div', {
                                    className: Pi.phoneTopLeftDivider,
                                    children: Object(OI.jsxs)(OE.a, {
                                      style: {
                                        textAlign: 'right',
                                        fontSize: '0.75rem',
                                        lineHeight: '0',
                                        textShadow:
                                          'rgb(55 71 79) -1px 1px 0px, rgb(55 71 79) 1px 1px 0px, rgb(55 71 79) 1px -1px 0px, rgb(55 71 79) -1px -1px 0px',
                                      },
                                      variant: 'body2',
                                      gutterBottom: true,
                                      children: ['#', PR],
                                    }),
                                  }),
                                ],
                              }),
                              Object(OI.jsx)('div', {
                                className: Pi.phoneTopMiddleContainer,
                              }),
                              Object(OI.jsxs)('div', {
                                className: Pi.phoneTopRightContainer,
                                children: [
                                  Object(OI.jsx)('i', {
                                    className: 'fas fa-sun fa-w-16 fa-fw fa-sm',
                                    style: {
                                      WebkitTextStrokeColor: 'black',
                                      WebkitTextStrokeWidth: '0.3px',
                                      marginLeft: '4px',
                                    },
                                  }),
                                  Object(OI.jsx)('i', {
                                    className:
                                      'fas fa-unlock fa-w-14 fa-fw fa-sm',
                                    style: {
                                      WebkitTextStrokeColor: 'black',
                                      WebkitTextStrokeWidth: '0.3px',
                                      marginLeft: '4px',
                                      color: 'rgb(96, 125, 139)',
                                    },
                                  }),
                                  Object(OI.jsx)('i', {
                                    onClick: function () {
                                      V4 && VV(true)
                                    },
                                    className: 'fas fa-'.concat(
                                      V4 ? 'wifi' : 'signal',
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
                          Object(OI.jsxs)('div', {
                            className: 'phone-bottom-container',
                            style: { zIndex: 501 },
                            children: [
                              Object(OI.jsx)('div', {
                                children: Object(OI.jsx)(Op.a, {
                                  title: 'Toggle Sounds',
                                  placement: 'top',
                                  sx: {
                                    backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                    fontSize: '1em',
                                    maxWdith: '1000px',
                                  },
                                  arrow: true,
                                  children: Object(OI.jsx)('i', {
                                    onClick: function () {
                                      Ob('toggleNotifications', {}).then(
                                        function (bB) {
                                          VX(bB)
                                        }
                                      )
                                    },
                                    className: 'fas '.concat(
                                      VT ? 'fa-bell-slash' : 'fa-bell',
                                      ' fa-w-14 fa-fw fa-sm'
                                    ),
                                  }),
                                }),
                              }),
                              Object(OI.jsx)('div', {
                                children: Object(OI.jsx)(Op.a, {
                                  title: 'Selfie!',
                                  placement: 'top',
                                  sx: {
                                    backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                    fontSize: '1em',
                                    maxWdith: '1000px',
                                  },
                                  arrow: true,
                                  children: Object(OI.jsx)('i', {
                                    onClick: function () {
                                      Ob('activateSelfieMode')
                                    },
                                    className:
                                      'fas fa-camera fa-w-16 fa-fw fa-sm',
                                  }),
                                }),
                              }),
                              Object(OI.jsx)(Oi.b, {
                                to: '/',
                                style: {
                                  color: '#fff',
                                  textDecoration: 'none',
                                },
                                children: Object(OI.jsx)('div', {
                                  onClick: function () {
                                    bA.push('/')
                                    Vk('')
                                    VV(false)
                                    Vd(false)
                                    VQ(false)
                                    VI(false)
                                    Va('home')
                                  },
                                  children: Object(OI.jsx)(Op.a, {
                                    title: 'Home',
                                    placement: 'top',
                                    sx: {
                                      backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                      fontSize: '1em',
                                      maxWdith: '1000px',
                                    },
                                    arrow: true,
                                    children: Object(OI.jsx)('i', {
                                      className:
                                        'far fa-circle fa-w-16 fa-fw fa-lg',
                                    }),
                                  }),
                                }),
                              }),
                              Object(OI.jsx)('div', {
                                children: Object(OI.jsx)(Op.a, {
                                  title: 'Switch Orientation',
                                  placement: 'top',
                                  sx: {
                                    backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                    fontSize: '1em',
                                    maxWdith: '1000px',
                                  },
                                  arrow: true,
                                  children: Object(OI.jsx)('i', {
                                    className:
                                      'fas fa-sync-alt fa-w-16 fa-fw fa-sm',
                                  }),
                                }),
                              }),
                              Object(OI.jsx)('div', {
                                children: Object(OI.jsx)(Op.a, {
                                  title: 'Explorer',
                                  placement: 'top',
                                  sx: {
                                    backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                  },
                                  arrow: true,
                                  children: Object(OI.jsx)('i', {
                                    className:
                                      'fab fa-internet-explorer fa-w-16 fa-fw fa-sm',
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(OI.jsx)('div', {
                            className:
                              'top-notifications-wrapper top-notifications-wrapper-mounted',
                            style: {
                              zIndex: 501,
                              display: PC.length ? '' : 'none',
                            },
                            children: PC.map(function (bV) {
                              return Object(OI.jsx)(
                                Od,
                                {
                                  deleteNotification: Pa,
                                  notification: bV,
                                },
                                bV.id
                              )
                            }),
                          }),
                          Object(OI.jsx)('div', {
                            className:
                              'top-notifications-wrapper top-notifications-wrapper-mounted',
                            style: {
                              maxHeight: '80px',
                              display: 'none',
                            },
                          }),
                          Object(OI.jsx)('div', {
                            className: Pi.wifiConnectModalContainer,
                            style: { display: VP ? '' : 'none' },
                            children: Object(OI.jsxs)('div', {
                              className: Pi.wifiConnectModalInnerContainer,
                              children: [
                                Object(OI.jsx)('div', {
                                  className: 'spinner-wrapper',
                                  style: { display: Vz ? '' : 'none' },
                                  children: Object(OI.jsxs)('div', {
                                    className: 'lds-spinner',
                                    children: [
                                      Object(OI.jsx)('div', {}),
                                      Object(OI.jsx)('div', {}),
                                      Object(OI.jsx)('div', {}),
                                      Object(OI.jsx)('div', {}),
                                      Object(OI.jsx)('div', {}),
                                      Object(OI.jsx)('div', {}),
                                      Object(OI.jsx)('div', {}),
                                      Object(OI.jsx)('div', {}),
                                      Object(OI.jsx)('div', {}),
                                      Object(OI.jsx)('div', {}),
                                      Object(OI.jsx)('div', {}),
                                      Object(OI.jsx)('div', {}),
                                    ],
                                  }),
                                }),
                                Object(OI.jsx)('div', {
                                  className: 'spinner-wrapper',
                                  style: { display: VF ? '' : 'none' },
                                  children: Object(OI.jsx)(OS.Checkmark, {
                                    size: '56px',
                                    color: '#009688',
                                  }),
                                }),
                                Object(OI.jsxs)('div', {
                                  className: 'component-simple-form',
                                  style: { display: Vn ? 'none' : '' },
                                  children: [
                                    Object(OI.jsx)('div', {
                                      children: Object(OI.jsx)('div', {
                                        className: 'input-wrapper',
                                        children: Object(OI.jsx)(OD.a, {
                                          fullWidth: true,
                                          sx: { width: '100%' },
                                          children: Object(OI.jsx)(Oo.a, {
                                            id: 'input-with-icon-textfield',
                                            label: 'Password',
                                            variant: 'standard',
                                            onChange: function (bV) {
                                              Vk(bV.target.value)
                                            },
                                            value: Vh,
                                            InputProps: {
                                              startAdornment: Object(OI.jsx)(
                                                Oa.a,
                                                {
                                                  position: 'start',
                                                  children: Object(OI.jsx)('i', {
                                                    className: 'fas fa-user-lock',
                                                  }),
                                                }
                                              ),
                                            },
                                          }),
                                        }),
                                      }),
                                    }),
                                    Object(OI.jsxs)('div', {
                                      className: 'buttons',
                                      children: [
                                        Object(OI.jsx)('div', {
                                          children: Object(OI.jsx)(OC.a, {
                                            onClick: function () {
                                              VV(false)
                                            },
                                            size: 'small',
                                            color: 'warning',
                                            variant: 'contained',
                                            children: 'Cancel',
                                          }),
                                        }),
                                        Object(OI.jsx)('div', {
                                          children: Object(OI.jsx)(OC.a, {
                                            onClick: function () {
                                              VQ(true)
                                              Vd(true)
                                              Ob('connectWifi', {}).then(
                                                function (bb) {
                                                  V9(true)
                                                  setTimeout(function () {
                                                    VQ(false),
                                                      VI(true),
                                                      setTimeout(function () {
                                                        VI(false)
                                                        VV(false)
                                                        Vd(false)
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
                          Object(OI.jsx)('div', {
                            className: 'phone-app-container',
                            style: { background: 'rgba(0, 0, 0, 0)' },
                            children: Object(OI.jsx)('div', {
                              className: Pi.phoneAppInnerContainer,
                              children: Object(OI.jsxs)('div', {
                                className: Pi.phoneAppApps,
                                children: [
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/information',
                                    onClick: function () {
                                      return Va('information')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Information',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#fff',
                                          background:
                                            'linear-gradient(356deg, rgba(0,132,255,1) 9%, rgba(75,181,255,1) 55%)',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/contacts',
                                    onClick: function () {
                                      return Va('contacts')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Contacts',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#fff',
                                          background:
                                            'linear-gradient(356deg, rgba(0,44,74,1) 9%, rgba(0,65,110,1) 55%)',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/calls',
                                    onClick: function () {
                                      return Va('calls')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Calls',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#fff',
                                          background:
                                            'linear-gradient(0deg, rgb(60, 194, 122) 0%, rgba(5,136,66,1) 100%)',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/messages',
                                    onClick: function () {
                                      return Va('messages')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Messages',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsxs)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#fff',
                                          background:
                                            'linear-gradient(0deg, rgba(0,182,21,1) 0%, rgba(128,236,109,1) 100%)',
                                        },
                                        children: [
                                          Object(OI.jsx)('img', {
                                            alt: 'useful',
                                            style: {
                                              height: '54px',
                                              borderRadius: '14px',
                                            },
                                            src: 'https://gta-assets.nopixel.net/images/phone-icons/conversations.png',
                                          }),
                                          Object(OI.jsx)('div', {
                                            className: 'app-notification',
                                            style: { display: 'none' },
                                          }),
                                        ],
                                      }),
                                    }),
                                  }),
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/erpinger',
                                    onClick: function () {
                                      return Va('erpinger')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Ping!',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#fff',
                                          background:
                                            'linear-gradient(0deg, rgba(72,105,255,1) 0%, rgba(121,37,255,1) 100%)',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/email',
                                    onClick: function () {
                                      return Va('email')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Email',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#fff',
                                          background:
                                            'linear-gradient(0deg, rgba(114,213,227,1) 0%, rgba(0,140,237,1) 100%)',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/yp',
                                    onClick: function () {
                                      return Va('yp')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'YP',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#fff',
                                          background:
                                            'linear-gradient(0deg, rgba(255,191,0,1) 0%, rgba(255,191,0,1) 100%)',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/twitter',
                                    onClick: function () {
                                      return Va('twitter')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Twatter',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#fff',
                                          background:
                                            'linear-gradient(0deg, rgba(23,23,23,1) 0%, rgba(23,23,23,1) 100%)',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/garage',
                                    onClick: function () {
                                      return Va('garage')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Vehicles',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#fff',
                                          background:
                                            'linear-gradient(180deg, rgba(233, 108, 123, 1) 0%, rgba(209, 13, 53, 1) 100%)',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/debt',
                                    onClick: function () {
                                      return Va('debt')
                                    },
                                    style: {
                                    //  display: PJ ? '' : 'none',
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Debt',
                                      placement: 'top',
                                      sx: {
                                      //  display: PJ ? '' : 'none',
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                      //    display: PJ ? '' : 'none',
                                          color: '#fff',
                                          background: '#faf8fb',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/wenmo',
                                    onClick: function () {
                                      return Va('wenmo')
                                    },
                                    style: {
                                  //    display: PJ ? '' : 'none',
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Wenmo',
                                      placement: 'top',
                                      sx: {
                                     //  display: PJ ? '' : 'none',
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                       //   display: PJ ? '' : 'none',
                                          color: '#fff',
                                          background: '#151718',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/documents',
                                    onClick: function () {
                                      return Va('documents')
                                    },
                                    style: {
                                   //   display: PJ ? '' : 'none',
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Documents',
                                      placement: 'top',
                                      sx: {
                                     //   display: PJ ? '' : 'none',
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                        // display: PJ ? '' : 'none',
                                          color: '#fff',
                                          background: '#da54d5',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/housing',
                                    onClick: function () {
                                      return Va('housing')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Housing',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#fff',
                                          background:
                                            'linear-gradient(0deg, rgba(61,146,69,1) 0%, rgba(61,146,69,1) 100%)',
                                        },
                                        children: Object(OI.jsx)('i', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/crypto',
                                    onClick: function () {
                                      return Va('crypto')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Crypto',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#fff',
                                          background: '#121315',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/jobs',
                                    onClick: function () {
                                      return Va('jobs')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Job Center',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#fff',
                                          background: '#1d1d1d',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/employment',
                                    onClick: function () {
                                      return Va('employment')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Employment',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#fff',
                                          background: '#1d1d1d',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/racing',
                                    onClick: function () {
                                      return Va('racing')
                                    },
                                    style: {
                                      display: Ps ? '' : 'none',
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Racing',
                                      placement: 'top',
                                      sx: {
                                        display: Ps ? '' : 'none',
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          display: Ps ? '' : 'none',
                                          color: '#fff',
                                          background: '#fe7228',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/calculator',
                                    onClick: function () {
                                      return Va('calculator')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Calculator',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#fff',
                                          background:
                                            'linear-gradient(180deg, rgba(233, 108, 123, 1) 0%, rgba(209, 13, 53, 1) 100%)',
                                        },
                                        children: Object(OI.jsx)('img', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/doj',
                                    onClick: function () {
                                      return Va('doj')
                                    },
                                    style: {
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Department of Justice',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          color: '#dfcf0d',
                                          background:
                                            'linear-gradient(0deg, rgba(63,88,187,1) 0%, rgba(63,88,187,1) 100%)',
                                        },
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-gavel fa-w-16 fa-fw',
                                          style: { fontSize: '40px' },
                                        }),
                                      }),
                                    }),
                                  }),
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/sportsbook',
                                    onClick: function () {
                                      return Va('sportsbook')
                                    },
                                    style: {
                                   //   display: PJ ? '' : 'none',
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'Diamond Sports Book',
                                      placement: 'top',
                                      sx: {
                                      //  display: PJ ? '' : 'none',
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                       //   display: PJ ? '' : 'none',
                                          color: '#fff',
                                          background:
                                            'linear-gradient(0deg, rgba(0,0,2,1) 0%, rgba(0,0,2,1) 100%)',
                                        },
                                        children: Object(OI.jsx)('i', {
                                          className: 'fas fa-gem fa-w-16 fa-fw',
                                          style: { fontSize: '40px' },
                                        }),
                                      }),
                                    }),
                                  }),
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/paynless',
                                    onClick: function () {
                                      return Va('paynless')
                                    },
                                    style: {
                                    //  display: PJ ? '' : 'none',
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      title: 'PayNLess',
                                      placement: 'top',
                                      sx: {
                                      //  display: PJ ? '' : 'none',
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                        //  display: PJ ? '' : 'none',
                                          color: '#fff',
                                          background: '#1d1d1d',
                                        },
                                        children: Object(OI.jsx)('i', {
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
                                  Object(OI.jsx)(Oi.b, {
                                    to: '/darkmarket',
                                    onClick: function () {
                                      return Va('darkmarket')
                                    },
                                    style: {
                                      display: V4 && V8 ? '' : 'none',
                                      color: '#fff',
                                      textDecoration: 'none',
                                    },
                                    children: Object(OI.jsx)(Op.a, {
                                      style: { display: V4 && V8 ? '' : 'none' },
                                      title: 'Dark Market',
                                      placement: 'top',
                                      sx: {
                                        backgroundColor: 'rgba(97, 97, 97, 0.9)',
                                        fontSize: '1em',
                                        maxWdith: '1000px',
                                      },
                                      arrow: true,
                                      children: Object(OI.jsx)('div', {
                                        className: Pi.phoneApp,
                                        style: {
                                          display: V4 && V8 ? '' : 'none',
                                          color: '#fff',
                                          background:
                                            'linear-gradient(to bottom, #c852ff, #a21de0)',
                                        },
                                        children: Object(OI.jsx)('i', {
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
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/information',
                              render: function () {
                                return Object(OI.jsx)(A5, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/contacts',
                              render: function () {
                                return Object(OI.jsx)(Ah, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/calls',
                              render: function () {
                                return Object(OI.jsx)(AE, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/messages',
                              render: function () {
                                return Object(OI.jsx)(P7, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/chat/:chatId',
                              render: function () {
                                return Object(OI.jsx)(PO, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/erpinger',
                              render: function () {
                                return Object(OI.jsx)(Az, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/email',
                              render: function () {
                                return Object(OI.jsx)(Ap, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/yp',
                              render: function () {
                                return Object(OI.jsx)(AF, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/twitter',
                              render: function () {
                                return Object(OI.jsx)(An, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/garage',
                              render: function () {
                                return Object(OI.jsx)(Ao, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/debt',
                              render: function () {
                                return Object(OI.jsx)(PP, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/wenmo',
                              render: function () {
                                return Object(OI.jsx)(Pb, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/documents',
                              render: function () {
                                return Object(OI.jsx)(AX, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/housing',
                              render: function () {
                                return Object(OI.jsx)(AU, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/crypto',
                              render: function () {
                                return Object(OI.jsx)(AJ, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/jobs',
                              render: function () {
                                return Object(OI.jsx)(AH, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/employment',
                              render: function () {
                                return Object(OI.jsx)(P2, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/employees/:businessId',
                              render: function () {
                                return Object(OI.jsx)(P5, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/racing',
                              render: function () {
                                return Object(OI.jsx)(AY, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/calculator',
                              render: function () {
                                return Object(OI.jsx)(Ph, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/doj',
                              render: function () {
                                return Object(OI.jsx)(Pz, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/sportsbook',
                              render: function () {
                                return Object(OI.jsx)(PM, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/paynless',
                              render: function () {
                                return Object(OI.jsx)(PI, {})
                              },
                            }),
                          }),
                          Object(OI.jsx)(Ok.c, {
                            children: Object(OI.jsx)(Ok.a, {
                              path: '/darkmarket',
                              render: function () {
                                return Object(OI.jsx)(P1, {})
                              },
                            }),
                          }),
                        ],
                      }),
                      Object(OI.jsxs)('div', {
                        className: 'phone-border-container',
                        style: {
                          display: 'android' === Vg ? '' : 'none',
                          bottom:
                            'android' === Vg && Py
                              ? '12px'
                              : PC.length
                              ? '-540px'
                              : '-1000px',
                        },
                        children: [
                          ' ',
                          Object(OI.jsxs)('div', {
                            className: 'phone-border-inner-container',
                            children: [
                              Object(OI.jsx)('div', {
                                className: 'phone-border-inner-border',
                              }),
                              Object(OI.jsx)('div', {
                                className: 'phone-border-inner-alignment',
                                children: Object(OI.jsx)('div', {
                                  className: 'phone-border-inner-white',
                                }),
                              }),
                            ],
                          }),
                        ],
                      }),
                      Object(OI.jsx)('div', {
                        className: 'phone-iphone-shell',
                        style: {
                          display: 'ios' === Vg ? '' : 'none',
                          bottom:
                            'ios' === Vg && Py
                              ? '0px'
                              : PC.length
                              ? '-550px'
                              : '-1000px',
                        },
                        children: Object(OI.jsx)('div', {
                          className: 'jss1264',
                          children: Object(OI.jsxs)('div', {
                            className: 'jss16465',
                            id: 'cores',
                            children: [
                              Object(OI.jsx)('div', { className: 'jss16471' }),
                              Object(OI.jsx)('div', { className: 'jss16472' }),
                              Object(OI.jsx)('div', { className: 'jss16473' }),
                              Object(OI.jsx)('div', { className: 'jss16474' }),
                              Object(OI.jsx)('div', {
                                className: 'jss16475',
                                children: Object(OI.jsx)('div', {
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
        O2(173)
        O2(174)
        O2(175)
        O2(176)
        O7.a.render(
          Object(OI.jsx)(Oi.a, {
            basename: '/',
            children: Object(OI.jsx)(OT.a, { children: Object(OI.jsx)(Pn, {}) }),
          }),
          document.getElementById('root')
        )
      },
      19: function (P, V, b) {},
    },
    [[177, 1, 2]],
  ])
  